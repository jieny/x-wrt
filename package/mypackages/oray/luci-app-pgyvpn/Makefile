include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for the PuGongYing VPN
LUCI_DEPENDS:=+lua-md5 +pgyvpn +luci-app-zerotier +luci-app-phtunnel +bzip2 +gzip +unzip +eject \
+fdisk +lsblk +grep +less +more +mount-utils +sed +tar +tree +whereis +which +whois \
+wg-installer-client +netcat +iperf3 +iftop +git-http +xl2tpd +openssh-sftp-server \
+iptables-mod-conntrack-extra +iptables-mod-extra +iptables-mod-filter \
+iptables-mod-tproxy +iptables-mod-socket +iptables-mod-iprange \
+wget-ssl +vsftpd +xtables-legacy +rsyncd +sudo \
+luci-proto-relay +luci-proto-wireguard +luci-mod-dashboard \
+libudns +libsodium +kmod-mtd-rw +kmod-netlink-diag +kmod-cryptodev

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
