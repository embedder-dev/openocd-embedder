# Embedder OpenOCD

**Embedder OpenOCD** is a build of [OpenOCD](https://openocd.org), the
open-source on-chip debugger, distributed with
[Embedder](https://embedder.dev) and installed automatically into
`~/.embedder/tools/openocd/`.

It is built from the **xPack OpenOCD** build system created by Liviu Ionescu
(<https://xpack.github.io/openocd/>), re-pinned to a newer upstream OpenOCD
commit than the latest xPack release provides. The build scripts, the exact
OpenOCD commit, and the list of changes are public at:

- <https://github.com/embedder-dev/openocd-embedder>

## Licensing

OpenOCD is free software licensed under the **GNU General Public License,
version 2 or later**. The full license text ships with this distribution at
`distro-info/licenses/openocd-0.12.0/COPYING`.

This binary is a **modified** build of OpenOCD: the startup greeting is
rebranded and the configure options differ from an upstream build. The
corresponding source is the upstream OpenOCD commit recorded in
`build-assets/scripts/versioning.sh` in the repository above, together with
the build scripts in that same repository.

The xPack build scripts this repository is derived from are MIT licensed;
see `LICENSE`.

Thank you to Liviu Ionescu and the OpenOCD developers for the open source
software this is built on.
