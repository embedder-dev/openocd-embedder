---

title: The xPack OpenOCD
permalink: /dev-tools/openocd/

summary: "A binary distribution of OpenOCD."

keywords: openocd

comments: true

date: 2015-09-04 17:02:00 +0300

redirect_to: https://xpack-dev-tools.github.io/openocd-xpack/

---

## Quicklinks

If you already know the general facts about the xPack OpenOCD, you can
directly skip to the desired pages.

User pages:

- [install]({{ site.baseurl }}/openocd/install/)
- [support]({{ site.baseurl }}/openocd/support/)
- [releases]({{ site.baseurl }}/openocd/releases/)

Developer & maintainer pages:

- [GitHub](https://github.com/xpack-dev-tools/openocd-xpack/) - the project repo
- [README-DEVELOPER](https://github.com/xpack-dev-tools/openocd-xpack/blob/xpack/README-DEVELOPER.md) -
  for information on how to build the binaries
- [README-MAINTAINER](https://github.com/xpack-dev-tools/openocd-xpack/blob/xpack/README-MAINTAINER.md) -
  for information on the workflow used to make releases

## Overview

The **xPack OpenOCD** is a cross-platform binary distribution of
[OpenOCD](https://openocd.org), the **Open On-Chip Debugger**,
an open source project hosted on
[SourceForge](https://sourceforge.net/projects/openocd/).

The OpenOCD project maintainers recommend that end-users
compile it using the latest version of the source code available from
the repository. OpenOCD is a rolling distribution, and currently
there are no special stable branches or tags
and there are no clear release dates for future versions.

If for GNU/Linux users compiling projects is common, Windows users do not
have an easy way of building OpenCOD from sources, and elaborate build
environments must be installed, making the whole process impractical.

If you are not interested in building from sources, and appreciate a
better integration with the environments like Eclipse, please feel free to use
the xPack OpenOCD binaries, and preferably install them in the default
locations.

{% include note.html content="OpenOCD is a very complex project, able
to work with many JTAG probes, but support for them must be enabled
at build time, so be sure that support for your JTAG probe was
enabled in the binaries you plan to use. The xPack OpenOCD includes
support for most existing probes, but does not guarantee that all are
included." %}

## Benefits

The main advantages of using the **xPack OpenOCD** are:

- a convenient, uniform and portable install/uninstall/upgrade procedure,
  the same procedure is used for all major
  platforms (Intel Windows 64-bit, Intel GNU/Linux 64-bit, Arm GNU/Linux
  64/32-bit, Intel macOS 64-bit, Apple Silicon macOS 64-bit)
- a better integration with development environments
  like **Eclipse Embedded CDT**.

All binaries are self-contained, they include all required libraries,
and can be installed in any location.

## Compatibility

The **xPack OpenOCD** is fully compatible with the original **OpenOCD**
distribution.

## Install

The details of installing the **xPack OpenOCD** on various platforms are
presented in the separate
[install]({{ site.baseurl }}/openocd/install/) page.

## Documentation

The original OpenOCD documentation is available online:

- <https://openocd.org/pages/documentation.html>

## Support

For the various support options, please read the separate
[support]({{ site.baseurl }}/openocd/support/) page.

## Change log

The release and change log is available in the repository
[`CHANGELOG.md`](https://github.com/xpack-dev-tools/openocd-xpack/blob/xpack/CHANGELOG.md) file.

## Build details

For those interested in building the binaries, please read the
[README-DEVELOPER](https://github.com/xpack-dev-tools/openocd-xpack/blob/xpack/README-DEVELOPER.md)
page.
However, the ultimate source for details are the build scripts themselves,
all available from the
[`openocd-xpack.git/scripts`](https://github.com/xpack-dev-tools/openocd-xpack/tree/xpack/scripts/)
folder.

## Releases

See the [releases]({{ site.baseurl }}/openocd/releases/) pages.
