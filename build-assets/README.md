# Embedder OpenOCD — build assets

The build scripts, xpm actions and dependency definitions used to produce the
`embedder-openocd-*` archives.

See the [repository README](../README.md) for what this fork is and how it
differs from upstream xPack, and [RELEASING.md](../RELEASING.md) for the build
and release procedure.

Key files:

- `scripts/VERSION` — the release version.
- `scripts/versioning.sh` — the pinned upstream OpenOCD commit and the
  dependency versions.
- `scripts/dependencies/openocd.sh` — the configure options and the two seds
  that constitute this distribution's delta over upstream OpenOCD.
- `scripts/application.sh` — the distribution name, which the packaging uses
  to compose the archive and its root folder.
