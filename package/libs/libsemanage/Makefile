#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsemanage
PKG_VERSION:=3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/SELinuxProject/selinux/releases/download/$(PKG_VERSION)
PKG_HASH:=f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c
PKG_MAINTAINER:=Thomas Petazzoni <thomas.petazzoni@bootlin.com>
PKG_LICENSE:=LGPL-2.1
PKG_LICENSE_FILES:=COPYING
PKG_CPE_ID:=cpe:/a:selinuxproject:libsemanage


HOST_BUILD_DEPENDS:=audit/host libselinux/host bzip2/host


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

PKG_INSTALL:=1

define Package/libsemanage
  SECTION:=libs
  DEPENDS:=+libaudit +libselinux +libbz2
  CATEGORY:=Libraries
  TITLE:=SELinux policy management library
  URL:=http://selinuxproject.org/page/Main_Page
endef

define Package/libsemanage/description
	libsemanage is the policy management library. It uses
	libsepol for binary policy manipulation and libselinux for
	interacting with the SELinux system. It also exec's helper
	programs for loading policy and for checking whether the
	file_contexts configuration is valid (load_policy and
	setfiles from policycoreutils) presently, although this may
	change at least for the bootstrapping case (for rpm).
endef #'


HOST_MAKE_FLAGS += \
	DESTDIR=$(STAGING_DIR_HOSTPKG) \
	PREFIX=""


define Build/Configure
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libsemanage.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,/usr/include,$$$${prefix}/include,g' $(1)/usr/lib/pkgconfig/libsemanage.pc
	$(SED) 's,/usr/lib,$$$${exec_prefix}/lib,g' $(1)/usr/lib/pkgconfig/libsemanage.pc
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/libsemanage/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsemanage.so.* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libsemanage))
