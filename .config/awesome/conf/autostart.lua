local awful = require("awful")

local autostart = { }
local desktop_autostart = {
	"picom -b --backend \"glx\"",
}
local laptop_autostart = {
	"nm-applet",
	"picom -b --backend \"xrender\"",
}
if laptop then
	for _, app in ipairs(laptop_autostart) do
		table.insert(autostart, app)
	end
else
	for _, app in ipairs(desktop_autostart) do
		table.insert(autostart, app)
	end
end

for _, app in ipairs(autostart) do
	awful.spawn.with_shell(app)
end
