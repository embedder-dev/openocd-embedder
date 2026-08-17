# Releasing Embedder OpenOCD

Producing a release is five steps: re-pin, build, verify, publish, then wire
the new version into Embedder.

## 1. Re-pin

Edit two files:

- `build-assets/scripts/VERSION` — the new version, e.g. `0.12.0-9`.
- `build-assets/scripts/versioning.sh` — add an `if` branch for the new
  version with the upstream commit. The version blocks are gated by regex
  (`=~ 0[.]12[.]0-[8]`), so a new VERSION **needs its own branch** or it falls
  through to the outer defaults and silently builds something else.

Check whether mainline has added adapters since the last pin. The
`config_options` list in `build-assets/scripts/dependencies/openocd.sh` is an
explicit `--enable-<adapter>` allowlist; an adapter that is not listed only
reaches `auto` and may not be compiled in.

### The caching trap

Changing the version and the commit is **not sufficient** for a local
rebuild. A stale build exits 0, produces a correctly named archive, and
contains the old OpenOCD — or, worse, a union of both. Three caches cause it:

1. The stamp file is `stamps/stamp-openocd-${version}-installed` where the
   version is **pre-release-stripped** — `0.12.0-8` and `0.12.0-9` both strip
   to `0.12.0` and share one stamp. A present stamp skips the entire
   download/configure/make body.
2. The source folder is a fixed `openocd.git`, not commit-scoped, so an
   existing checkout at the old commit is reused.
3. The install prefix `build/<config>/application/` is never emptied, so
   `make install` layers new scripts on top of the old ones and the archive
   ships the union. This has been observed producing 435 target configs where
   the correct answer was 397, including configs upstream had deleted.

Before rebuilding locally:

```sh
B=build-assets/build/<config>
rm -rf $B/application $B/archive $B/deploy
rm -f  $B/<triplet>/stamps/stamp-openocd-0.12.0-installed
rm -rf $B/<triplet>/build/openocd-0.12.0
rm -rf $B/sources/openocd.git
```

CI runs on a clean runner and is unaffected.

## 2. Build

Dispatch each `build-<host>.yml` workflow with the new version. All five run
on GitHub-hosted runners:

| Host | Runner |
|---|---|
| darwin-arm64 | `macos-15` |
| darwin-x64 | `macos-15-intel` |
| linux-arm64 | `ubuntu-24.04-arm` |
| linux-x64 | `ubuntu-24.04` (Docker) |
| win32-x64 | `ubuntu-24.04` (Docker, mingw cross-build) |

Each stages its archive under the `embedder-staging` pre-release tag. The five
jobs update that release independently; if two finish within seconds of each
other one publish step can lose the race, which shows up as a missing asset.
Re-run that single job — the archives are idempotent.

Windows and Linux need Docker. If `docker-prepare` fails locally, it is
usually the `chown --recursive` it runs over the bind-mounted home tripping
over read-only git pack files: `rm -rf build/*/sources/openocd.git && chmod -R u+w build`.

## 3. Verify the binary, never the exit code

Both known failure modes produce a green build and a correctly named archive.

```sh
bin/openocd --version                          # must report the NEW commit
ls openocd/scripts/target/**/*.cfg | wc -l     # must move
bin/openocd -c "adapter list" -c exit          # must include new adapters
```

The built target list must **equal** upstream's
`git ls-tree HEAD -- tcl/target`, not merely be a superset — a superset is the
signature of the un-emptied install prefix.

## 4. Publish

Dispatch `publish-release.yml`. It refuses to publish unless all five hosts
are staged, verifies every `.sha`, creates a **draft** release at
`v<version>`, and prints the sha256 values.

The release is a draft on purpose: Embedder downloads these assets
anonymously, and a draft's assets are not publicly readable. Publish only
after the checks in step 3. **The repository must be public** — the runtime
downloader sends no credentials.

## 5. Wire it into Embedder

Four files in the `embedder` repo pin the version, and all four must move
together:

| File | What to change |
|---|---|
| `packages/cli/src/lib/toolchains/openocd/manifest.json` | version, repo, five filenames + sha256s |
| `packages/cli/src/lib/gdb/openocdTargets.json` | regenerate: `bun scripts/syncOpenocdTargets.ts` |
| `scripts/install.sh` | version, filenames, sha256s, download URL |
| `scripts/install.ps1` | same, for win32-x64 |

`install.sh` and `install.ps1` duplicate the manifest by hand. Miss one and
users get the old OpenOCD preinstalled while the CLI downloads the new one
into a second directory; nothing prunes the old tree.

Also review:

- `OPENOCD_MATCH_VERSION` in `openocdTargetDiscovery.ts` — bump it to
  invalidate cached auto-derived targets when matching changes.
- `PENDING_UPSTREAM_TARGETS` — remove entries the new build now ships.
- The alias tables, if upstream moved configs into vendor directories. Moves
  are self-healing at OpenOCD's end (`proc find` in `src/helper/startup.tcl`
  inserts a vendor directory for `gigadevice nordic sifive st ti`), but our
  alias destinations are compared as strings and may need restating.

Finally, verify on real hardware. Unit tests assert argument strings; only
running the binary catches a config that fails at spawn.
