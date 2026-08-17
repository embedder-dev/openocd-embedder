# -----------------------------------------------------------------------------
#
# This file is part of the xPack project (http://xpack.github.io).
# Copyright (c) 2019-2025 Liviu Ionescu. All rights reserved.
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/mit.
#
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Application specific definitions. Included with source.

# Used to display the application name.
XBB_APPLICATION_NAME=${XBB_APPLICATION_NAME:-"OpenOCD"}

# Used as part of file/folder paths.
XBB_APPLICATION_LOWER_CASE_NAME=${XBB_APPLICATION_LOWER_CASE_NAME:-"openocd"}

# The distro name is what the packaging uses to build the archive and its
# root folder: <distro>-<application>-<version>-<host>. Renaming it from
# "xpack" is what makes an Embedder build distinguishable from an upstream
# xPack one of the same OpenOCD version, on disk and in support logs.
XBB_APPLICATION_DISTRO_NAME=${XBB_APPLICATION_DISTRO_NAME:-"Embedder"}
XBB_APPLICATION_DISTRO_LOWER_CASE_NAME=${XBB_APPLICATION_DISTRO_LOWER_CASE_NAME:-"embedder"}
XBB_APPLICATION_DISTRO_TOP_FOLDER=${XBB_APPLICATION_DISTRO_TOP_FOLDER:-"Embedder"}

XBB_APPLICATION_DESCRIPTION="${XBB_APPLICATION_DISTRO_NAME} ${XBB_APPLICATION_NAME}"

declare -a XBB_APPLICATION_DEPENDENCIES=( openocd )
declare -a XBB_APPLICATION_COMMON_DEPENDENCIES=( libusb1 libusb-w32 libusb0 libftdi libiconv hidapi autotools texinfo )

# -----------------------------------------------------------------------------

XBB_GITHUB_ORG="${XBB_GITHUB_ORG:-"embedder-dev"}"
XBB_GITHUB_REPO="${XBB_GITHUB_REPO:-"${XBB_APPLICATION_LOWER_CASE_NAME}-embedder"}"
# Releases are staged as a draft in this same repo rather than in a separate
# pre-releases repo, so this is only read by the local trigger-workflow-*
# helper scripts.
XBB_GITHUB_PRE_RELEASES="${XBB_GITHUB_PRE_RELEASES:-"${XBB_APPLICATION_LOWER_CASE_NAME}-embedder"}"

XBB_NPM_PACKAGE="${XBB_NPM_PACKAGE:-"@xpack-dev-tools/${XBB_APPLICATION_LOWER_CASE_NAME}@${XBB_NPM_PACKAGE_VERSION:-"next"}"}"


# -----------------------------------------------------------------------------

# If you want to build OpenOCD from another repo then uncomment the
# following defines and tweak as needed.

# XBB_APPLICATION_OPENOCD_GIT_URL="https://github.com/openocd-org/openocd.git"
# XBB_APPLICATION_OPENOCD_GIT_BRANCH="master"
# XBB_APPLICATION_OPENOCD_GIT_COMMIT="HEAD"

# -----------------------------------------------------------------------------
