local awful     = require("awful")
local beautiful = require("beautiful")
local helpers   = require("helpers")
local gears     = require("gears")
local wibox     = require("wibox")
local naughty   = require("naughty")
local rubato    = require("modules.rubato")
-- local bling     = require("modules.bling")
require("config.menu")
require("config.keys")

awful.screen.connect_for_each_screen(function(s)
 
    barmenu = wibox.widget {
        awful.widget.launcher({ image = beautiful.launcher_icon,
                                menu = menu }),
        widget = wibox.container.margin,
        margins = 4
    }
    taglist = require("ui.bar.widgets.taglist")(s)
    tasklist = require("ui.bar.widgets.tasklist")(s)
    volumebar = require("ui.bar.widgets.sliders.volume")(s)
    systray = require("ui.bar.widgets.systray")(s) 
    clock = require("ui.bar.widgets.clock")
    layouticon = helpers.embox(
        awful.widget.layoutbox {
            screen  = s,
            buttons = {
                awful.button({ }, 1, function () awful.layout.inc( 1) end),
                awful.button({ }, 3, function () awful.layout.inc(-1) end),
                awful.button({ }, 4, function () awful.layout.inc(-1) end),
                awful.button({ }, 5, function () awful.layout.inc( 1) end)
            }
        }
    )


    -- Create the wibox
    s.wibar = awful.wibar({ position = "left", screen = s, width = 36 })

    -- Add widgets to the wibox
    s.wibar:setup {
        layout = wibox.layout.align.vertical,
        { -- Top widgets
            layout = wibox.layout.fixed.vertical,
            barmenu,
            taglist
        },
        tasklist,
	{
        layout = wibox.layout.fixed.vertical,
    	volumebar,
	systray,
	clock,
	layouticon
	}
    }
end)
