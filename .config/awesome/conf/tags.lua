local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    awful.tag.add("6", {
	screen = s,
	layout = awful.layout.suit.floating,
    })
end)
