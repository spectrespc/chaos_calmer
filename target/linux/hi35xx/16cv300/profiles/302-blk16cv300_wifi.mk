#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/IVG-HP203Y-AE-WiFi
	NAME:=Hi3516Cv300+IMX291+WiFi+SD
	PACKAGES:=block-mount dosfsck f2fs-tools hi35xx-rtl8188eu-firmware hostapd-common hostapd-common-old iw iwinfo kmod-fs-f2fs kmod-fs-vfat kmod-hi35xx-rtl8188eu mkdosfs wireless-tools wpa-cli wpad-mini
endef

define Profile/IVG-HP203Y-AE-WiFi/Description
	Package Description
endef
$(eval $(call Profile,IVG-HP203Y-AE-WiFi))
