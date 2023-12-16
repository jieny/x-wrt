#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for Zerotier
LUCI_DEPENDS:=+zerotier
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-zerotier

# 不能放在luci.mk后面，会不执行
define my_install_step
	echo 000-root$(PKG_BUILD_DIR)/root-$(BOARD) >> $(TOPDIR)/testlog.txt
	echo 111-BUILD_DIR_HOST=$(BUILD_DIR_HOST) >> $(TOPDIR)/testlog.txt
	echo 222-PKG_INSTALL_DIR=$(PKG_INSTALL_DIR) >> $(TOPDIR)/testlog.txt
	echo 333-CURDIR=$(CURDIR) >> $(TOPDIR)/testlog.txt
	echo 444-BOARD=$(BOARD) >> $(TOPDIR)/testlog.txt
	echo 555-BUILD_DIR=$(BUILD_DIR) >> $(TOPDIR)/testlog.txt
	echo 666-TARGET_ROOTFS_DIR=$(TARGET_ROOTFS_DIR) >> $(TOPDIR)/testlog.txt
	echo 777-CONFIG_TARGET_ROOTFS_DIR=$(CONFIG_TARGET_ROOTFS_DIR) >> $(TOPDIR)/testlog.txt
	# 000-root/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/build_dir/target-x86_64_musl/luci-app-zerotier/root-x86
	# 111-BUILD_DIR_HOST=/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/build_dir/hostpkg
	# 222-PKG_INSTALL_DIR=/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/build_dir/target-x86_64_musl/luci-app-zerotier/ipkg-install
	# 333-CURDIR=/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/package/mypackages/luci-app-zerotier
	# 444-BOARD=x86
	# 555-BUILD_DIR=/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/build_dir/target-x86_64_musl
	# 666-TARGET_ROOTFS_DIR=/mnt/img2/tmp/x-wrt-x86-ok-26a279304f442548fe3aed33e5d5b202-202312092144/build_dir/target-x86_64_musl
	# 777-CONFIG_TARGET_ROOTFS_DIR=

	rm -rf $(PKG_BUILD_DIR)/root-$(BOARD)/etc/init.d/zerotier
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature

# 覆盖 $(TOPDIR)/feeds/luci/luci.mk 里的 install
# 测试好像时覆盖不了，不知道为什么
