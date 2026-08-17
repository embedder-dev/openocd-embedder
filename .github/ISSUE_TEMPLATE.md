### Before you file

This repository builds a **binary distribution** of OpenOCD for
[Embedder](https://embedder.dev). It does not add functionality to OpenOCD or
fix bugs in it.

- Problems with **OpenOCD itself** (a target that will not halt, a flash
  driver that misbehaves, a config file that is wrong) belong upstream, at the
  [OpenOCD support channels](https://openocd.org/discussion/). Please
  reproduce them with a stock OpenOCD build first.
- Problems with **Embedder** — target detection, the debug session, the UI —
  belong in the Embedder issue tracker, not here.
- Problems with **this distribution** — a missing host, a broken archive, a
  checksum mismatch, an adapter that is not compiled in, a target config that
  ships upstream but not here — are what this tracker is for.

### Description

[What went wrong]

### Steps to reproduce

1. [First step]
2. [Second step]

**Expected:** [What you expected to happen]

**Actual:** [What actually happened]

### Versions

- Output of `openocd --version` (the full line, including the commit hash)
- The archive you installed, e.g. `embedder-openocd-0.12.0-8-darwin-arm64.tar.gz`
- Operating system and architecture
- Debug probe and target MCU, if relevant

Without a reproduction we usually cannot act on a report.
