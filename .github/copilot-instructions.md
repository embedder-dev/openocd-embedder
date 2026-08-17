# Copilot Instructions

## Project overview

This is **Embedder OpenOCD**: a fork of
[xpack-dev-tools/openocd-xpack](https://github.com/xpack-dev-tools/openocd-xpack)
that re-pins the same build system to a newer upstream OpenOCD commit than the
latest xPack release provides. It produces the `embedder-openocd-*` archives
that [Embedder](https://embedder.dev) installs into `~/.embedder/tools/openocd/`.

## Folder structure

- `/build-assets/scripts` — the build. `VERSION` and `versioning.sh` hold the
  pin; `dependencies/openocd.sh` holds the configure options and the two seds
  that are this distribution's entire delta over upstream OpenOCD.
- `/build-assets/build` — build output, not tracked.
- `/.github/workflows` — one build workflow per host, plus `publish-release.yml`.

## Things that are easy to get wrong

- A re-pin needs its own `if` branch in `versioning.sh`; the blocks are gated
  by a version regex and a new `VERSION` otherwise falls through to the
  defaults.
- A local rebuild after a re-pin reuses three caches and will silently ship
  the old OpenOCD, or a union of old and new. See `RELEASING.md`.
- Verify a build by running the binary, never by the exit code. Both known
  failure modes produce a green build and a correctly named archive.

## Language and style

- Use British English spelling and grammar, matching upstream.
- Use a professional tone.
- Prefer folder to directory.
