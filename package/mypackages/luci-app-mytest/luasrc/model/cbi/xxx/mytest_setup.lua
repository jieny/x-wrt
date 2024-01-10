-- m = Map("cbi_file", translate("First Tab Form"), translate("Please fill out the form below")) -- cbi_file is the config file in /etc/config
-- mytest 是配置文件名
-- m = Map("alist", translate("Alist"), translate("A file list program that supports multiple storage.") .. "<br/>" .. [[<a href="https://alist.nn.ci/zh/guide/drivers/local.html" target="_blank">]] .. translate("User Manual") .. [[</a>]])

m = Map("mytest", translate("My test"), translate("描述 后面 .. 是拼接的意思") .. "<br/>" .. [[<a href="https://www.baidu.com" target="_blank">]] .. translate("User Manual") .. [[</a>]])
m.reset = true

-- d = m:section(TypedSection, "info", "Part A of the form")  -- info is the section called info in cbi_file
-- a = d:option(Value, "name", "Name"); a.optional=false; a.rmempty = false;  -- name is the option in the cbi_file
-- 需要一个config文件包含section和options，在这里我们在/etc/confi目录下新建一个cbi_file文件
-- config 'info' 'A'
--    option 'name' 'OpenWRT'


local s = m:section(NamedSection, "base", "base", translate("Base Setup1"))

enabled = s:option(Flag, "enabled", translate("Enabled"))
enabled.rmempty = false
-- 1 为 √
enabled.default = 0

-- 文本框
-- 第二个参数是配置文件里的option后面的名字
-- 第三个参数是显示的名字
-- 请输入：有效端口值
o = s:option(Value, "port", translate("Port"))
o.datatype = "and(port,min(1))"
-- rmempty 是 remove empty 的缩写，全称是 "remove empty values"
-- 在 UCI 中，rmempty 是用于配置项的一个属性，用于指定是否在保存配置时删除空值（空字符串或 nil）
-- 当 rmempty 被设置为 true 时，表示如果配置项的值为空，那么在保存配置时将会删除该配置项。如果设置为 false，则即使配置项的值为空，也会保留该配置项
o.rmempty = false
o.default = "5244"

-- 字符串类型
o = s:option(Value, "site_url", translate("Site URL"), translate("When the web is reverse proxied to a subdirectory, this option must be filled out to ensure proper functioning of the web. Do not include '/' at the end of the URL"))
o.datatype = "string"
o.rmempty = true
o.default = "/etc/alist"

-- 数字
-- 请输入：正整数值
o = s:option(Value, "max_connections", translate("Max Connections"), translate("0 is unlimited, It is recommend to set a low number of concurrency (10-20) for poor performance device"))
o.datatype = "and(uinteger,min(0))"
o.rmempty = false
o.default = "0"

-- 按钮
o = s:option(Button, "admin_info", translate("Reset Password"))
-- 这行代码告诉 LuCI 渲染系统，选项的显示文本包含 HTML 或者其他富文本格式
o.rawhtml = true
-- 这行代码指定了一个模板文件，用于自定义按钮选项的显示。模板文件的路径是 "alist/admin_info"。这样可以通过自定义模板文件来灵活控制按钮选项的外观和行为
-- /usr/lib/lua/luci/view/alist/admin_info.htm
o.template = "alist/admin_info"


m.apply_on_parse = true
m.on_after_apply = function(self)
	io.popen("/etc/init.d/phtunnel status")
end

return m
