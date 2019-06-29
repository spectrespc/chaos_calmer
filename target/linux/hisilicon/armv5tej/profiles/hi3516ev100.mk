#
# Copyright (C) 2007-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/hi3516ev100
  NAME:=hi3516ev100, default
  PACKAGES:=busybox demo
endef

define Profile/hi3516ev100/Description
	Package set compatible with hardware any Hisilicon hi3516ev100 SoC.
endef

$(eval $(call Profile,hi3516ev100))