local awful = require("awful")
local helpers = require("helpers")

kbdcfg.widget:buttons(awful.util.table.join(
	awful.button({ }, 1, function () kbdcfg.switch_next() end),
	awful.button({ }, 3, function () kbdcfg.menu:toggle() end)
	)
)
return helpers.embox(kbdcfg.widget, false, 4)
