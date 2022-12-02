local awful = require("awful")

local autostart = {
}
local desktop_autostart = {
	"picom -b --no-vsync",
}
local laptop_autostart = {
	"picom -b --vsync",
	"nm-applet",
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
