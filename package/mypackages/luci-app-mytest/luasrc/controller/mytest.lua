module("luci.controller.mytest", package.seeall)

function index()
	-- 定义了一个菜单项，其路径为 "admin" -> "new_tab"，它是一个一级菜单项
	-- firstchild() 表示这个菜单项是其父菜单的第一个子菜单项
	-- "XXX" 表示菜单项的显示名称为 "XXX"
	-- 100 表示菜单项的权重，用于决定菜单项在菜单中的排序位置
	-- .dependent=false 表示该菜单项不依赖于其他项。这意味着无论其他项的状态如何，这个菜单项都会显示
	entry({"admin", "new_tab"}, firstchild(), "XXX", 100).dependent=false
	entry({"admin", "new_tab", "mytest1"}, alias("admin", "services", "mytest", "setup"), "CBI Tab", 1)
	entry({"admin", "new_tab", "mytest2"}, alias("admin", "services", "mytest", "status"), "View Tab", 2)

	-- 路由 /cgi-bin/luci/admin/services/mytest
	entry({"admin", "services", "mytest"}, alias("admin", "services", "mytest", "setup"), _("测试"))
	entry({"admin", "nas", "mytest"}, alias("admin", "services", "mytest", "setup"), _("哈哈"), 20)
	-- 文件路径 /usr/lib/lua/luci/controller
	entry({"admin", "services", "mytest", "setup"}, cbi("xxx/mytest_setup"), _("Setup设置"), 1).leaf = true
	entry({"admin", "services", "mytest", "status"}, template("xxx/phtunnel_status"), _("Status"), 2).leaf = true
	entry({"admin", "services", "mytest", "log"}, template("xxx/phtunnel_log"), _("Log"), 3).leaf = true

	local node = entry({"admin", "services", "mytest", "inner_status"}, template("xxx/phtunnel_inner_status"), nil, 4)
	node.leaf = true
	node.hidden = true

	node = entry({"admin", "services", "mytest", "log_off"}, template("xxx/phtunnel_log_off"), nil, 5)
	node.leaf = true
	node.hidden = true
end
