-- m = Map("cbi_file", translate("First Tab Form"), translate("Please fill out the form below")) -- cbi_file is the config file in /etc/config
m = Map("phtunnel")
m.reset = true

-- d = m:section(TypedSection, "info", "Part A of the form")  -- info is the section called info in cbi_file
-- a = d:option(Value, "name", "Name"); a.optional=false; a.rmempty = false;  -- name is the option in the cbi_file
-- 需要一个config文件包含section和options，在这里我们在/etc/confi目录下新建一个cbi_file文件
-- config 'info' 'A'
--    option 'name' 'OpenWRT'


local s = m:section(NamedSection, "base", "base", translate("Base Setup1"))

enabled = s:option(Flag, "enabled", translate("Enabled"))

enabled.rmempty = false

m.apply_on_parse = true
m.on_after_apply = function(self)
	io.popen("/etc/init.d/phtunnel restart")
end

return m
