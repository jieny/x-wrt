# 包含 OpenWrt 根目录下的 rules.mk 文件，该文件定义了所需的规则和变量
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/target.mk

ifneq ($(CONFIG_USE_UCLIBC),)
	PKG_LIBC_V:=uClibc-1.0.x
else
	PKG_LIBC_V:=$(LIBC)-unknown
endif

ifeq ($(ARCH),arm)
	ifneq ($(findstring $(CPU_SUBTYPE), neon neon-vfpv4 vfpv3),)
	PKG_ARCH_PGYYPN:=arm_$(CPU_TYPE)_$(CPU_SUBTYPE)-$(PKG_LIBC_V)
	else
	PKG_ARCH_PGYYPN:=arm_cortex-a7-$(PKG_LIBC_V)
	endif
endif
ifeq ($(ARCH),aarch64)
	ifneq ($(findstring $(CPU_TYPE), cortex-a53 cortex-a72),)
	PKG_ARCH_PGYYPN:=aarch64_$(CPU_TYPE)-$(PKG_LIBC_V)
	else
	PKG_ARCH_PGYYPN:=aarch64_generic-$(PKG_LIBC_V)
	endif
endif
ifeq ($(ARCH),mips)
	PKG_ARCH_PGYYPN:=mips_24kc-$(PKG_LIBC_V)
endif
ifeq ($(ARCH),mipsel)
	ifneq ($(findstring $(CPU_TYPE), 24kec 74kc 1004kc),)
	PKG_ARCH_PGYYPN:=$(ARCH)_$(CPU_TYPE)-$(PKG_LIBC_V)
	else
	PKG_ARCH_PGYYPN:=mipsel_24kc-$(PKG_LIBC_V)
	endif
endif
ifeq ($(BOARD),x86)
	ifeq ($(ARCH),x86_64)
	PKG_ARCH_PGYYPN:=x86_64-$(PKG_LIBC_V)
	else
	PKG_ARCH_PGYYPN:=i386_pentium-mmx-$(PKG_LIBC_V)
	endif
endif

# 设置PKG_* 变量 https://openwrt.org/docs/guide-developer/packages#buildpackage_variables
# 软件包的名称，在菜单选项中将看见，必须与目录名称一致
PKG_NAME:=mytest
# 软件包版本，如果软件包的源代码是在线下载的，版本号要与服务器上的一致
PKG_VERSION:=1.0.1
# 软件包的Makefile版本，自己编
PKG_RELEASE:=1

# 软件包的编译过程目录名字，这个要与源代码解压完以后生成的目录名字一样，否则就找不到源代码了
# 软件包编译时的构建目录
# 默认情况下，PKG_BUILD_DIR 的值是 $(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
#PKG_BUILD_DIR:=$(BUILD_DIR)/mytest-$(PKG_VERSION)


# 软件包源代码文件的名字
#PKG_SOURCE:=mytest-$(PKG_VERSION).tar.gz
#PKG_SOURCE:=pgyvpnsvr
# 软件包源代码的下载地址，如果不填写就不下载, 直接从dl/下查找
#PKG_SOURCE_URL:=http://www.mytest.com/download/
#PKG_SOURCE_URL:=https://mirrors.oray.com/orayos/packages/$(PKG_NAME)/$(PKG_ARCH_PGYYPN)/$(PKG_VERSION)/bin
# 对下载下来的软件包的校验
#PKG_MD5SUM:=9b7dc52656f5cbec846a7ba3299f73bd
# SHA256
#PKG_HASH:=skip
# 指定使用哪个解压工具（zcat、bzcat、unzip）
#PKG_CAT:=zcat
# 通过代码仓库获得代码 git、svn、bzr、cvs、darcs、hg
#PKG_SOURCE_PROTO:=git
# 如果是通过svn获得代码，这表示svn的版本号
#PKG_REV:=


# 软件包编译的时候依赖哪些其他软件包
#PKG_BUILD_DEPENDS:=+openssl


# 用于指定软件包的编译选项
# nonshared 是一种编译选项，它可以让编译器生成静态链接库而不是共享链接库。这样可以避免在运行时需要依赖外部共享库，从而简化软件包的部署和维护
PKG_FLAGS:=nonshared
# 用于指定软件包的维护人员信息
PKG_MAINTAINER:=Jieny <576420147@qq.com>


include $(INCLUDE_DIR)/package.mk


# 定义软件包的信息
define Package/mytest
	# base: 基本软件包
	# kernel: 内核模块或驱动程序
	# libs: 库文件
	# net: 网络相关软件包
	# utils: 实用工具软件包
	# web: Web服务或应用程序
	SECTION:=utils
	CATEGORY:=ZZZ
	#SUBMENU:=XXX
	DEPENDS:=@(arm||aarch64||mips||mipsel||i386||x86_64) \
	+blockd +ca-bundle +ca-certificates +sudo \
	+kmod-scsi-core +kmod-cryptodev +kmod-ipt-nat +kmod-ipt-nat6 +kmod-nft-tproxy +kmod-netlink-diag +kmod-mppe +kmod-pptp +libsodium +libudns \
	+python3-light +python3-pip \
	+luci-proto-ipv6 +luci-proto-ppp +luci-proto-relay +luci-proto-wireguard \
	+curl +rclone-config +rsyncd +vsftpd +wget-ssl \
	+xtables-legacy +iptables-mod-conntrack-extra +iptables-mod-extra +iptables-mod-filter +iptables-mod-iprange +iptables-mod-socket +iptables-mod-tproxy \
	+ip-full +openssh-sftp-server \
	+openvpn-easy-rsa +openvpn-openssl +pptpd +wireguard-tools +xl2tpd \
	+git-http +nginx-full +nginx-mod-dav-ext +nginx-mod-headers-more +nginx-mod-lua +nginx-mod-stream +nginx-mod-ts \
	+iftop +iperf3 +netcat +tcpdump +tcping +wakeonlan +wg-installer-client \
	+bzip2 +gzip +unzip \
    +eject +fdisk +lsblk +nano-full +acpid \
    +grep +less +lsof +more +mount-utils +sed +tar +tree +whereis +which +whois
	TITLE:=mytest, TITLE
	URL:=https://www.xxx.com/$(PKG_FLAGS)${PKG_ROOT}
	PKGARCH:=all
endef

# 定义软件包的说明
# 没有 \ 的话下一行会换行且如果有空格的话也是有会生效的
define Package/mytest/description
	This is Test Package \
	Ethernet bridging configuration utility \
	Manage ethernet bridging; a way to connect networks together to
	form a larger network.
endef

# define Download/extra
#   FILE:=pgyvpn_oraysl
#   URL:=$(PKG_SOURCE_URL)
#   HASH:=skip
# endef
# $(eval $(call Download,extra))

# 定义空的编译前处理，表示不做处理 
define Build/Prepare
	echo '定义空的编译前处理，表示不做处理'
	echo "Preparing..."
	# mkdir -p /mnt/img2/tmp/new/x-wrt-cr660x-ok/build_dir/target-mipsel_24kc_musl/mytest
	mkdir -p $(PKG_BUILD_DIR)
	# mv /mnt/img2/tmp/new/x-wrt-cr660x-ok/dl/{pgyvpn_oraysl,pgyvpnsvr} /mnt/img2/tmp/new/x-wrt-cr660x-ok/build_dir/target-mipsel_24kc_musl/mytest
	#mv $(DL_DIR)/{pgyvpn_oraysl,pgyvpnsvr} $(PKG_BUILD_DIR)
	#chmod +x $(PKG_BUILD_DIR)/{pgyvpn_oraysl,pgyvpnsvr}
endef

# 定义空的配置，表示不配置
define Build/Configure
	#$(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

# 定义空的编译，表示不编译
define Build/Compile
	true
endef

define Package/mytest/preinst
#!/bin/sh
echo "preinst..."
[ -z "$${IPKG_INSTROOT}" ] && {
	pidof pgyvpnsvr > /dev/null && \
		test -f $${PKG_ROOT}etc/init.d/pgyvpn && \
			/etc/init.d/pgyvpn stop; true
}
exit 0
endef

# 定义软件包安装时做的事情
define Package/mytest/install
	echo "install...start"
	
	# $(INSTALL_DIR) 表示创建目录，权限为 0755
	# $(1) 表示假设为目标系统，指路由器的系统，$(1)/etc 表示路由器上的 etc
	$(INSTALL_DIR) $(1)/data/
	$(INSTALL_DIR) $(1)/etc/config
	# $(INSTALL_DIR) $(1)/usr/local/bin/lib/
	# $(INSTALL_DIR) $(1)/etc/init.d
	# $(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	# $(INSTALL_DIR) $(1)/usr/sbin
	# $(INSTALL_DIR) $(1)/usr/share/pgyvpn
	
	# $(CP) 表示复制文件
	# ./files 这里的 ./ 表示软件包所在路径，即 package/utils/mytest/files
	# 复制 ./files/usr/bin/portal 到目标系统
	# $(CP) ./files/usr/bin/portal $(1)/usr/local/bin/
	# 复制 ./files/usr/bin/lib/* 到目标系统
	# $(CP) ./files/usr/bin/lib/* $(1)/usr/local/bin/lib/
	# $(CP) $(PKG_BUILD_DIR)/{pgyvpn_oraysl,pgyvpnsvr} $(1)/usr/sbin
    
	# $(INSTALL_BIN) 表示复制文件，权限为 0755
	# $(INSTALL_CONF) 表示复制文件，权限为 0600
	# $(INSTALL_DATA) 表示复制文件，权限为 0644
	# 和 $(CP) 的区别 创建目标路径（如果目标路径不存在），将源二进制文件复制到目标路径，设置目标文件的权限，更新目标文件的时间戳和元数据（例如所有者和组）
	# install -m0755 ./files/etc/config/mytest.conf /mnt/img2/tmp/new/x-wrt-cr660x-ok/build_dir/target-mipsel_24kc_musl/mytest/.pkgdir/mytest/etc/config/
	$(INSTALL_BIN) ./files/etc/config/mytest.conf $(1)/etc/config/
	$(INSTALL_BIN) ./files/etc/config/mytest.conf $(1)/etc/mytest.conf.bak
	# $(INSTALL_BIN) ./files/etc/config/* $(1)/etc/config/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/mytest $(1)/data
	$(INSTALL_CONF) ./files/etc/config/mytest.conf $(1)/etc/config/

	echo "install...end"
endef

define Package/mytest/postinst
#!/bin/sh
echo "postinst..."
[ -z "$${IPKG_INSTROOT}" ] && {
	/etc/init.d/pgyvpn restart; true
}
exit 0
endef

# 脚本处理完毕，调用
$(eval $(call BuildPackage,mytest))
