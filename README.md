# OpenIPC firmware

Alternative firmware for IP cameras and NVRs based on the HiSilicon SoCs

More [information about project](https://openipc.org)

[![CI status](https://img.shields.io/github/v/release/OpenIPC/chaos_calmer.svg)](https://github.com/OpenIPC/chaos_calmer/releases)
[![CI status](https://img.shields.io/github/downloads/OpenIPC/chaos_calmer/total.svg)](https://github.com/OpenIPC/chaos_calmer/releases)
[![Backers](https://opencollective.com/openipc/tiers/backer/badge.svg?label=backer&color=brightgreen)](https://opencollective.com/openipc)
[![Backers](https://opencollective.com/openipc/tiers/badge.svg)](https://opencollective.com/openipc)

[![Backers](https://opencollective.com/openipc/tiers/backer.svg?avatarHeight=36)](https://opencollective.com/openipc#support)

## Pre-built images

### Latest development build

| Building status |    SoC    | U-Boot | Kernel | Rootfs | Maintainer |
|-----------------|-----------|--------|--------|--------|------------|
|![CV100 images](https://github.com/widgetii/chaos_calmer/workflows/CV100%20images/badge.svg?branch=master)|Hi3516CV100|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv100-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv100-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv100-default-root.squashfs)|FlyRouter
|![CV200 images](https://github.com/widgetii/chaos_calmer/workflows/CV200%20images/badge.svg?branch=master)|Hi3516CV200|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv200-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv200-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv200-default-root.squashfs)|FlyRouter
|![CV300 images](https://github.com/widgetii/chaos_calmer/workflows/CV300%20images/badge.svg?branch=master)|Hi3516CV300|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv300-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv300-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv300-default-root.squashfs)|FlyRouter
|![CV300 images](https://github.com/widgetii/chaos_calmer/workflows/CV300%20images/badge.svg?branch=master)|Hi3516EV100|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16ev100-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv300-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv300-default-root.squashfs)|FlyRouter
|![CV100 images](https://github.com/widgetii/chaos_calmer/workflows/CV100%20images/badge.svg?branch=master)|Hi3518EV100|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-18ev100-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv100-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv100-default-root.squashfs)|FlyRouter
|![CV200 images](https://github.com/widgetii/chaos_calmer/workflows/CV200%20images/badge.svg?branch=master)|Hi3518EV200|[uboot](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-18ev200-u-boot.bin)|[kernel](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv200-default-uImage)|[rootfs](https://github.com/OpenIPC/chaos_calmer/releases/download/latest/openwrt-hi35xx-16cv200-default-root.squashfs)|FlyRouter

## How to flash to target hardware

1. Backup your original flash firmware (use TFTP or Telnet method whether you
prefer)

2. Download U-Boot, kernel and rootfs images to your TFTP server

3. Flash U-Boot

```
sf probe 0 ; sf lock 0
tftp 0x82000000 openwrt-hi35xx-16cv300-u-boot.bin
sf erase 0x0 0x50000
sf write ${fileaddr} 0x0 ${filesize}
reset
```

4. Flash Linux kernel

```
sf probe 0 ; sf lock 0
tftp 0x82000000 openwrt-hi35xx-16cv300-default-uImage
sf erase 0x50000 0x200000
sf write ${fileaddr} 0x50000 ${filesize}
```

5. Flash rootfs

```
sf probe 0 ; sf lock 0
tftp 0x82000000 openwrt-hi35xx-16cv300-default-root.squashfs
sf erase 0x250000 0x500000
sf write ${fileaddr} 0x250000 ${filesize}
```

## Build manually

### Build on Linux machine

Usage example for Debian (8 or 9)/Ubuntu

```
git clone --depth=1 https://github.com/OpenIPC/chaos_calmer.git OpenIPC
cd OpenIPC
./Project_OpenIPC.sh update
./Project_OpenIPC.sh 18ev200_zftlab_rotek
```

Ready to flash images will be located at `bin/hi35xx/openwrt-hi35xx-*`

### Or use Docker for building

```Dockerfile
FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential gawk libncurses-dev intltool python \
    git subversion time unzip zlib1g-dev libssl-dev wget curl cpio bc \
    gettext gettext-base liblocale-gettext-perl

WORKDIR /src/chaos_calmer
```

## Sponsor

Please consider donating on [Opencollective](https://opencollective.com/openipc)

## Commercial Support

Commercial support for OpenIPC is available.

Please contact [OpenIPC Inc.](mailto:flyrouter@gmail.com) to inquire further.
