local awful = require("awful")
local helpers = require("helpers")
local beautiful = require("beautiful")
local wibox = require("wibox")

kbdcfg.widget.font   = beautiful.bfont
kbdcfg.widget.halign = "center"
kbdcfg.widget.valign = "center"

local keebwgt = wibox.widget {
	kbdcfg.widget,
	widget = wibox.container.background,
	fg = beautiful.accent,
	forced_height = 24
}

keebwgt:buttons(awful.util.table.join(
	awful.button({ }, 1, function () kbdcfg.switch_next() end),
	awful.button({ }, 3, function () kbdcfg.menu:toggle() end)
	)
)
return helpers.embox(keebwgt, nil, nil, nil, false)
