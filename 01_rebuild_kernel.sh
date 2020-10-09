#!/bin/bash


clear

make -j$((`nproc` + 1)) target/linux/{clean,compile,install} V=99

cat ./build_dir/target-arm_arm926ej-s_uClibc-0.9.33.2_eabi/linux-hi35xx_16cv300/linux-3.18.20/arch/arm/boot/zImage ./target/linux/hi35xx/dts/hi3516cv300-demb.dtb > ./zImage-dtb

#./mkimage \
./staging_dir/host/bin/mkimage \
  -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "OpenIPC v20.08.1 alpha" \
  -d ./zImage-dtb ./openwrt-hi35xx-16cv300-default-uImage

