Staging area for Embedder OpenOCD builds.

Each `build-<host>.yml` run replaces its own archive here. These binaries are
untested and may be broken or incomplete — Embedder never downloads from this
tag. `publish-release.yml` promotes a complete set of five hosts into a real
`v<version>` release.
