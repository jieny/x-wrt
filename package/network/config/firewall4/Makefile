#
# Copyright (C) 2021 Jo-Philipp Wich <jo@mein.io>
#

# 在 dl 中找文件 firewall4-2023-11-03-698a5335.tar.xz
# 新建 a b 两个文件夹，复制压缩包里的 root 到两个文件夹
# 修改 b 文件夹中的配置文件 "C:\Users\jieny\Desktop\b\root\etc\config\firewall"
# 用 WSL
# cd /mnt/c/Users/jieny/Desktop
# git diff a/root/etc/config/firewall b/root/etc/config/firewall > 300-fw4-config.patch
# 去掉 300-fw4-config.patch 中重复的 /a和/b

include $(TOPDIR)/rules.mk

PKG_NAME:=firewall4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=$(PROJECT_GIT)/project/firewall4.git
PKG_SOURCE_DATE:=2023-11-03
PKG_SOURCE_VERSION:=698a53354fd280aae097efe08803c0c9a10c14c2
PKG_MIRROR_HASH:=e38484bffe11a04a67069128aa3b8a8c707ad58c79c0de2785a5d995421457aa
PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
PKG_LICENSE:=ISC

include $(INCLUDE_DIR)/package.mk

define Package/firewall4
  SECTION:=net
  CATEGORY:=Base system
  TITLE:=OpenWrt 4th gen firewall
  DEPENDS:= \
	+kmod-nft-core +kmod-nft-fib \
	+kmod-nft-nat \
	+nftables-json \
	+ucode +ucode-mod-fs +ucode-mod-ubus +ucode-mod-uci
  EXTRA_DEPENDS:=ucode (>= 2022-03-22)
  PROVIDES:=uci-firewall
endef

define Package/firewall4/description
 This package provides an nftables-based implementation of the UCI firewall
 sharing the same configuration format.
endef

define Package/firewall4/conffiles
/etc/config/firewall
/etc/nftables.d/
/etc/firewall.include
endef

define Package/firewall4/install
	$(CP) -a $(PKG_BUILD_DIR)/root/* $(1)/
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_CONF) ./files/firewall.include $(1)/etc/firewall.include
endef

define Build/Compile
endef

$(eval $(call BuildPackage,firewall4))
