# Embedder OpenOCD

Embedder's build of [OpenOCD](https://openocd.org), the open-source on-chip
debugger. [Embedder](https://embedder.dev) downloads these archives at runtime
and installs them into `~/.embedder/tools/openocd/`.

This is a fork of
[xpack-dev-tools/openocd-xpack](https://github.com/xpack-dev-tools/openocd-xpack),
the cross-platform OpenOCD build system created by
[Liviu Ionescu](https://github.com/ilg-ul), re-pinned to a newer upstream
OpenOCD commit than the latest xPack release provides.

## Why this fork exists

xPack's last OpenOCD release, `0.12.0-7`, snapshots upstream at 30 Sep 2025,
and the project has been dormant since. That snapshot is missing configs for
parts our users have on their desks — among them every ESP32 RISC-V variant
(C2/C3/C6/H2), the Silicon Labs Series 2 line, STM32N6 and STM32H7R/S, and the
STM32WBA split into `wba2x`/`wba5x`/`wba6x`.

Rather than wait, we re-pin the same build system to a current upstream
commit. The build system itself is not bitrotted — a cold darwin-arm64 build
takes about nine minutes and reproduces upstream's artifact layout exactly.

## What differs from an upstream xPack build

- **The pinned OpenOCD commit**, in `build-assets/scripts/versioning.sh`.
- **Three configure flags** for adapters that are new in mainline and would
  otherwise only reach `auto`: `--enable-cklink`, `--enable-ftdi-cjtag`,
  `--enable-xvc`.
- **The greeting**, which reads `Embedder Open On-Chip Debugger`, so a binary
  from this fork is identifiable at `--version`.
- **The distribution name**, so archives are `embedder-openocd-*` rather than
  `xpack-openocd-*` and cannot be confused with an upstream build of the same
  OpenOCD version.

Everything else — the dependency versions, the XBB toolchain, the packaging
and self-containment rules — is upstream xPack's, unchanged.

## Building

Prerequisites: Node.js 20+ and `xpm` (`npm install --location=global xpm`).

```sh
xpm install -C build-assets
xpm install --config darwin-arm64 -C build-assets
xpm run build --config darwin-arm64 -C build-assets
```

`xpm run build` is the **native** path and refuses to cross-build hosts —
including `darwin-x64` from Apple Silicon. Linux and Windows go through Docker
with `xpm run docker-prepare --config <c>` followed by
`xpm run docker-build --config <c>`; Windows is a mingw cross-build inside the
amd64 Linux image, so no Windows machine is needed. In practice, use CI: every
`build-<host>.yml` workflow runs on a GitHub-hosted runner, and
`macos-15-intel` is the only way to get `darwin-x64`.

See [RELEASING.md](RELEASING.md) for the release procedure, including the
caching traps that make a re-pin silently ship the wrong OpenOCD.

## License

OpenOCD is free software under the **GNU General Public License, version 2 or
later**. The full text ships inside every archive at
`distro-info/licenses/openocd-0.12.0/preferred/GPL-2.0`, alongside the
upstream `COPYING` that names it.

The binaries published here are **modified** builds of OpenOCD, as described
above. Their corresponding source is the upstream OpenOCD commit pinned in
`build-assets/scripts/versioning.sh`, obtainable from
[openocd-org/openocd](https://github.com/openocd-org/openocd), together with
the build scripts in this repository.

The xPack build scripts this repository derives from are released under the
[MIT License](https://opensource.org/licenses/mit), with all rights reserved
to [Liviu Ionescu](https://github.com/ilg-ul); see [LICENSE](LICENSE).
Embedder's changes are offered under the same terms.

With thanks to Liviu Ionescu and the OpenOCD developers.
