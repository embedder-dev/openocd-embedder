---

title: How to install the xPack OpenOCD binaries
permalink: /dev-tools/openocd/install/

summary: "The recommended method is via xpm."

version: "0.11.0"
xpack-subversion: "4"
version-date: "2022-03-25-19:34"

comments: true
toc: false

date: 2015-09-09 19:43:00 +0300

redirect_to: https://xpack-dev-tools.github.io/openocd-xpack/docs/install/

---

## Overview

The **xPack OpenOCD** can be installed automatically, via `xpm` (the
recommended method), or manually, by downloading and unpacking one of the
portable archives.

{% capture easy_install %}

## Easy install

The easiest way to install OpenOCD is by using the **binary xPack**, available as
[`@xpack-dev-tools/openocd`](https://www.npmjs.com/package/@xpack-dev-tools/openocd)
from the [`npmjs.com`](https://www.npmjs.com) registry.

### Prerequisites

The only requirement is a recent
xpm, which is a portable
[Node.js](https://nodejs.org) command line application. To install it,
follow the instructions from the
[xpm install]({{ site.baseurl }}/xpm/install/) page.

### Install

With xpm available, installing
the latest version of the package is quite easy:

```sh
cd my-project
xpm init # Only at first use.

xpm install @xpack-dev-tools/openocd@latest --verbose
```

This command will always install the latest available version,
in the global xPacks store, which is a platform dependent folder
(check the output of the `xpm` command for the actual folder used on
your platform).

{% capture include_1 %}
The install location can be configured using the
`XPACKS_STORE_FOLDER` environment variable; for more details please check the
[xpm folders]({{ site.baseurl }}/xpm/folders/) page.
{% endcapture %}

{% include tip.html content=include_1 %}

{% include tip.html content="The archive content is unpacked into a folder
named `.content`. On some platforms
this might be hidden for normal browsing, and require
separate options (like `ls -A`) or, in file browsers, to enable
settings like **Show Hidden Files**." %}

xPacks aware tools, like the **Eclipse Embedded CDT plug-ins** automatically
identify binaries installed with
xpm and provide a convenient method to manage paths.

{% include important.html content="Automatic
path discovery for the packages from the new `@xpack-dev-tools` scope was
added to **GNU MCU Eclipse plug-ins** with v4.6.1 in 2019-09-23; update
older versions or configure the path manually." %}

### Uninstall

To remove the links from the current project:

```sh
cd my-project

xpm uninstall @xpack-dev-tools/openocd
```

To completely remove the package from the central xPacks store:

```sh
xpm uninstall --global @xpack-dev-tools/openocd --verbose
```

{% endcapture %}

{% capture manual_install %}

## Manual install

For all platforms, the **xPack OpenOCD** binaries are released as portable
archives that can be installed in any location.

The archives can be downloaded from the
GitHub [releases](https://github.com/xpack-dev-tools/openocd-xpack/releases/)
page.

{% endcapture %}

{% capture windows %}

{{ easy_install }}

### Test

To check if the xpm installed OpenOCD starts, use something like:

```doscon
C:\>%USERPROFILE%\AppData\Roaming\xPacks\@xpack-dev-tools\openocd\{{ page.version }}-{{ page.xpack-subversion }}.1\.content\bin\openocd.exe --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

{{ manual_install }}

### Download

The Windows versions of **xPack OpenOCD**
are packed as ZIP files.
Download the latest version named like:

- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-win32-x64.zip`

{% include note.html content="In case you wonder where the suffix comes
from, it is exactly the Node.js `process.platform` and `process.arch`.
The `win32` part is confusing, but we have to live with it." %}

### Unpack

To manually install the xPack OpenOCD,
unpack the archive and copy it into the
`%USERPROFILE%\AppData\Roaming\xPacks\openocd`
(for example `C:\Users\ilg\AppData\Roaming\xPacks\openocd`) folder;
according to Microsoft, `AppData\Roaming` is the recommended location for
installing user specific packages.

{% include note.html content="For manual installs, the recommended
install location is slightly different from the xpm install folders,
which use the scope (like `@xpack-dev-tools`) to group different tools,
and `.content` to store the unpacked archive." %}

{% include important.html content="Although perfectly possible to
install OpenOCD in any folder, it is highly recommended to use this
path, since by default the Eclipse Embedded CDT debug plug-ins search
for the executable in this location." %}

The result is a structure like:

![The OpenOCD folders structure]({{ site.baseurl }}/assets/images/2019/windows-folders-openocd.png)

### Test

To check if the manually installed OpenOCD starts, use something like:

```doscon
C:\>%USERPROFILE%\AppData\Roaming\xPacks\openocd\xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}\bin\openocd.exe --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

### Drivers

As usual on Windows, mastering drivers is a challenge and OpenOCD is no
exceptions, so don't be surprised to encounter many incompatible drivers
for various JTAG probes.

### Zadig

The OpenOCD distribution includes some libusb
drivers, and recommends to run the [`zadig.exe`](https://zadig.akeo.ie) tool to activate them.

For example
[ARM-USB-OCD](https://www.olimex.com/Products/ARM/JTAG/) from
[Olimex](https://www.olimex.com/), after installing the vendor drivers,
asks to install Zadig and convert the vendor drivers to WinUSB drivers.

{% include warning.html content="Although converting the vendor drivers
to WinUSB drivers will make OpenOCD happy, please be aware that other
tools using the original drivers will no longer work while Zadig is
active, and to make them work you need to uninstall the Zadig driver
for the device and reinstall the vendor driver (see
[Zadig FAQ](https://github.com/pbatard/libwdi/wiki/FAQ#Help_Zadig_replaced_the_driver_for_the_wrong_device_How_do_I_restore_it)).
Our
recommendation is to use Zadig only as a last resort solution, and, when
possible, prefer the manufacturer drivers." %}

### ST-LINK/V2

One example of compatible drivers are the ST-LINK/V2 USB drivers, from ST,
available as part number
[STSW-LINK009](https://www.st.com/web/en/catalog/tools/FM147/SC1887/PF260219).
Download the `stsw-link009.zip` archive, extract its content into a separate
folder, and run the `dpinst_amd64.exe` (or `dpinst_x86.exe`) with
administrative privileges.

As for most Windows drivers, to complete the installation, a restart
usually helps.

Connect the ST-LINK/v2 or the DISCOVERY board and check in **Control Panel**
→ **System** → **Device Manager** if the JTAG is operational.

![ST-LINK Windows device]({{ site.baseurl }}/assets/images/2019/windows-devices-stlink.png)

For other probes follow the manufacturer instructions.

{% include note.html content="All Windows tests were performed on Windows 10.
If, for any
reasons, you still use older versions, especially the venerable Windows XP,
some differences may be observed in the USB subsystem; to stay on the
safe side, try to always use original manufacturer drivers." %}

{% endcapture %}

{% capture macos %}

{{ easy_install }}

### Test

To check if the xpm installed OpenOCD starts, use something like:

```console
$ ~/.local/xPacks/@xpack-dev-tools/openocd/{{ page.version }}-{{ page.xpack-subversion }}.1/.content/bin/openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

{{ manual_install }}

### Download

The macOS versions of **xPack OpenOCD**
are packed as `.tar.gz` archives.
Download the latest version named like:

- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-darwin-x64.tar.gz`
- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-darwin-arm64.tar.gz`

### Unpack

To manually install the xPack OpenOCD,
unpack the archive and copy it to
`~/.local/xPacks/openocd/<version>`:

```sh
mkdir -p ~/.local/xPacks/openocd
cd ~/.local/xPacks/openocd

tar xvf ~/Downloads/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-darwin-x64.tar.gz
chmod -R -w xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}
```

{% include note.html content="For manual installs, the recommended
install location is different from the xpm install folders." %}

{% include important.html content="Although perfectly possible to
install OpenOCD in any folder, it is highly recommended to use this
path, since by default the Eclipse Embedded CDT debug plug-ins search
for the executable in this location." %}

The result is a structure like:

```console
$ tree -L 2 /Users/ilg/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}
/Users/ilg/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}
├── OpenULINK
│   └── ulink_firmware.hex
├── README.md
├── bin
│   └── openocd
├── contrib
│   ├── 60-openocd.rules
│   └── libdcc
├── distro-info
│   ├── CHANGELOG.md
│   ├── licenses
│   ├── patches
│   └── scripts
├── libexec
│   ├── libftdi1.2.5.0.dylib
│   ├── libftdi1.2.dylib -> libftdi1.2.5.0.dylib
│   ├── libgcc_s.1.dylib
│   ├── libhidapi.0.dylib
│   └── libusb-1.0.0.dylib
├── scripts
│   ├── bitsbytes.tcl
│   ├── board
│   ├── chip
│   ├── cpld
│   ├── cpu
│   ├── fpga
│   ├── interface
│   ├── mem_helper.tcl
│   ├── memory.tcl
│   ├── mmr_helpers.tcl
│   ├── target
│   ├── test
│   └── tools
└── share
    └── doc

21 directories, 14 files
```

### Test

To check if the manually installed OpenOCD starts, use something like:

```console
$ ~/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}/bin/openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```
{% endcapture %}

{% capture linux %}

{{ easy_install }}

### Test

To check if the xpm installed OpenOCD starts, use something like:

```console
$ ~/.local/xPacks/@xpack-dev-tools/openocd/{{ page.version }}-{{ page.xpack-subversion }}.1/.content/bin/openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

{{ manual_install }}

### Download

The GNU/Linux versions of **xPack OpenOCD**
are packed as `.tar.gz` archives.
Download the latest version named like:

- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-linux-x64.tar.gz`
- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-linux-arm.tar.gz`
- `xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-linux-arm64.tar.gz`

As the name implies, these are GNU/Linux `tar.gz` archives; they were build on
Ubuntu, but can be executed on most recent GNU/Linux distributions.

### Unpack

To manually install the xPack OpenOCD,
unpack the archive and move it to
`~/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}`:

```sh
mkdir -p ~/.local/xPacks/openocd
cd ~/.local/xPacks/openocd

tar xvf ~/Downloads/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}-linux-x64.tar.gz
chmod -R -w xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}
```

{% include note.html content="For manual installs, the recommended
install location is slightly different from the xpm install folders,
which use the scope (like `@xpack-dev-tools`) to group different tools,
and `.content` to store the unpacked archive." %}

{% include important.html content="Although perfectly possible to
install OpenOCD in any folder, it is highly recommended to use this
path, since by default the Eclipse Embedded CDT debug plug-ins search
for the executable in this location." %}

```console
$ tree -L 2 '/home/ilg/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}'
/home/ilg/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}/
├── bin
│   └── openocd
├── contrib
│   ├── 60-openocd.rules
│   └── libdcc
├── distro-info
│   ├── CHANGELOG.md
│   ├── licenses
│   ├── patches
│   └── scripts
├── libexec
│   ├── libftdi1.so.2 -> libftdi1.so.2.5.0
│   ├── libftdi1.so.2.5.0
│   ├── libhidapi-hidraw.so.0 -> libhidapi-hidraw.so.0.0.0
│   ├── libhidapi-hidraw.so.0.0.0
│   ├── libiconv.so.2 -> libiconv.so.2.6.1
│   ├── libiconv.so.2.6.1
│   ├── libudev.so.1 -> libudev.so.1.6.9
│   ├── libudev.so.1.6.9
│   ├── libusb-1.0.so.0 -> libusb-1.0.so.0.3.0
│   └── libusb-1.0.so.0.3.0
├── OpenULINK
│   └── ulink_firmware.hex
├── README.md
├── scripts
│   ├── bitsbytes.tcl
│   ├── board
│   ├── chip
│   ├── cpld
│   ├── cpu
│   ├── fpga
│   ├── interface
│   ├── mem_helper.tcl
│   ├── memory.tcl
│   ├── mmr_helpers.tcl
│   ├── target
│   ├── test
│   └── tools
└── share
    └── doc

21 directories, 19 files
```

### Test

To check if the manually installed OpenOCD starts, use something like:

```console
$ ~/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}/bin/openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

### UDEV

For the JTAG probes implemented as USB devices (actually most of them),
the last installation step on GNU/Linux is to configure the **UDEV**
subsystem. OpenOCD provides an UDEV rules file defining all the
supported IDs; to install it, just copy the file to `/etc/udev/rules.d`
and eventually notify the daemon:

```sh
sudo cp ~/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}/contrib/60-openocd.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
```

{% include tip.html content="If you previously installed the
J-Link binaries, the USB IDs were
already added to UDEV. The above OpenOCD rules file also defines the
J-Link ID. Apparently UDEV does not complain; if you encounter
problems, just comment out the definition in the OpenOCD file." %}

### USB access rights

On some GNU/Linux distributions, the UDEV definitions are not enough,
or are not effective, and when trying to access the JTAG probe,
an error is issued:

```console
libusb_open failed: LIBUSB_ERROR_ACCESS
```

If this happens, first try to start openocd with sudo; if this works,
for regular work you also need to grant your user permission to use the USB.

For example, on Ubuntu you need to issue something like:

```sh
sudo usermod -aG plugdev $USER
```

Then restart and login again.

If you still have problems, check your distribution documentation and
when you have a functional solution post it on the project GitHub Discussions.

### Test

To check if the manually installed OpenOCD starts, use something like:

```console
$ ~/.local/xPacks/openocd/xpack-openocd-{{ page.version }}-{{ page.xpack-subversion }}/bin/openocd --version
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
```

{% endcapture %}

{% include platform-tabs.html %}

## Testing

To test if the xpm installed OpenOCD is able to connect to a specific board,
it is generally
necessary to select the interface and the processor. As a shortcut, for
some well known boards, there are ready made configuration files
to set both the interface and the processor. For example, on
macOS, to test a connection via ST/LINK v2 to the STM32F4DISCOVERY board,
you can use the sample below:

```console
$ ~/.local/xPacks/@xpack-dev-tools/openocd/{{ page.version }}-{{ page.xpack-subversion }}.1/.content/bin/openocd -f board/stm32f4discovery.cfg
xPack OpenOCD x86_64 Open On-Chip Debugger {{ page.version }}+dev ({{ page.version-date }})
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
Info : The selected transport took over low-level target control. The results might differ compared to plain JTAG/SWD
adapter speed: 2000 kHz
adapter_nsrst_delay: 100
none separate
srst_only separate srst_nogate srst_open_drain connect_deassert_srst
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Info : clock speed 2000 kHz
Info : STLINK V2J14S0 (API v2) VID:PID 0483:3748
Info : Target voltage: 2.881412
Info : stm32f4x.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : Listening on port 3333 for gdb connections
^C
```
