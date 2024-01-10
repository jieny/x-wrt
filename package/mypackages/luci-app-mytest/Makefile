include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-mytest
PKG_VERSION:=1.0.11
PKG_RELEASE:=1

LUCI_TITLE:=LuCI Support for the mytest
LUCI_DEPENDS:=+cgi-io +curl +luci-compat +luci-lib-json

define Package/$(PKG_NAME)/conffiles

endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
# 
#[ -n "${IPKG_INSTROOT}" ] || {
#	( . /etc/uci-defaults/luci-alist ) && rm -f /etc/uci-defaults/luci-alist
#	exit 0
#}

echo "postinst..."

# 检查环境变量 IPKG_INSTROOT 是否为空
# 如果环境变量为空，那么 && 后面的命令将被执行
[ -z "$${IPKG_INSTROOT}" ] && {
	# 【; true】 用于确保整个命令块的退出码为0
	# 即使 /etc/init.d/pgyvpn restart 执行失败，整个命令块也将被认为是成功的，因为 true 始终返回成功
	# 也可以把 true 放在下一行，同时 ; 可以不要
	/etc/init.d/nginx status; true
}

# 作用是告诉安装程序（postinst 脚本）脚本执行成功
# 是一个退出命令，其中的数字表示退出状态码。通常，0 表示成功，而其他数字表示不同的错误或状态
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
