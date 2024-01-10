-- 导入必要的模块
local sys = require("luci.sys")
local json = require("cjson")

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

-- 创建一个名为 "basic" 的部分
local s = m:section(NamedSection, "base", "base", translate("Base Setup1"))

-- 添加一个开关控件
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

-- 添加一个选择框控件
o = s:option(ListValue, "select_box", translate("Select Box"))
o:value("option1", "Option 1")
o:value("option2", "Option 2")
o:value("option3", "Option 3")

-- 添加一个文本框控件
o = s:option(Value, "text_field", translate("Text Field"))
o.description = translate("Enter some text here.")

-- 添加一个按钮控件
o = s:option(Button, "my_button", translate("Go admin/system/system"))
o.inputstyle = "apply"
o.write = function(self, section)
	-- 在按钮被点击时执行的操作
	sys.call("echo 'Button clicked!' > /tmp/button_clicked")
	-- luci.http.redirect(luci.dispatcher.build_url("admin", "system", "system"))

	-- 创建一个 Lua 表格
	local myObject = {
		key1 = 'value1',
		key2 = 'value2',
		key3 = {
			subkey1 = 'subvalue1一样',
			subkey2 = 'subvalue2饿了'
		}
	}

	-- 将 Lua 表格转换为 JSON 格式
	local serialized_config = json.encode(myObject);
	serialized_config = json.encode(section);

	-- 在生成的 JSON 字符串中替换掉 "
	-- serialized_config = serialized_config:gsub("\"", ""):gsub(" ", "")
	serialized_config = serialized_config:gsub("\"", "")

	-- {key1:value1,key3:{subkey2:subvalue2,subkey1:subvalue1},key2:value2}
	sys.call("echo " .. serialized_config .. " > /tmp/button_clicked")

	--serialized_config = "test";

	-- serialized_config = '"' .. serialized_config .. '"'

	-- 构建 JavaScript 代码，使用 alert 弹窗显示序列化后的字符串
	local javascript_code = [[
        <script type="text/javascript">
            alert("]] .. serialized_config .. [[");
        </script>
    ]]
	-- javascript_code = "<script type=\"text/javascript\">alert(\"" .. serialized_config .. "\");</script>"

	-- 发送 JavaScript 代码到浏览器
	luci.http.write(javascript_code)
end


m.apply_on_parse = true
m.on_after_apply = function(self)
	io.popen("/etc/init.d/phtunnel status")
end

return m
