#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/IVG-HP203Y-AE
  NAME:=Hi3516Cv300+IMX291
  PACKAGES:=busybox
endef

define Profile/IVG-HP203Y-AE/Description
	Package Description
endef
$(eval $(call Profile,IVG-HP203Y-AE))
