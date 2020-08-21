#!/bin/sh
#
# tested on U-boot 2010.06 ONLY

dd if=./u-boot_hi3616cv100_xm.img of=./reg_info_hi3516cv100.bin bs=1 skip=64 count=4096