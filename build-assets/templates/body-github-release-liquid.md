**Embedder OpenOCD v{{releaseVersion}}**

A build of [OpenOCD](https://openocd.org) distributed with
[Embedder](https://embedder.dev) and installed automatically into
`~/.embedder/tools/openocd/`.

Built with the [xPack OpenOCD](https://github.com/xpack-dev-tools/openocd-xpack)
build system by Liviu Ionescu, re-pinned to a newer upstream OpenOCD commit
than the latest xPack release provides. The exact commit is recorded in
`build-assets/scripts/versioning.sh` at the tag for this release.

## Archives

| Host | Archive |
|---|---|
| macOS Apple Silicon | `embedder-openocd-{{releaseVersion}}-darwin-arm64.tar.gz` |
| macOS Intel | `embedder-openocd-{{releaseVersion}}-darwin-x64.tar.gz` |
| Linux arm64 | `embedder-openocd-{{releaseVersion}}-linux-arm64.tar.gz` |
| Linux x64 | `embedder-openocd-{{releaseVersion}}-linux-x64.tar.gz` |
| Windows x64 | `embedder-openocd-{{releaseVersion}}-win32-x64.zip` |

Each archive is accompanied by a `.sha` file carrying its SHA-256.

## License

OpenOCD is free software under the **GNU General Public License, version 2
or later**; the full text ships inside each archive at
`distro-info/licenses/openocd-0.12.0/COPYING`.

These are **modified** builds: the startup greeting is rebranded and the
configure options differ from an upstream build. The corresponding source is
the upstream OpenOCD commit pinned in this repository, together with the
build scripts here.

The xPack build scripts this repository derives from are MIT licensed.
