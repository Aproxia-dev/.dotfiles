local awful     = require("awful")
local beautiful = require("beautiful")
local helpers   = require("helpers")
local wibox     = require("wibox")
-- local bling     = require("modules.bling")
require("conf.menu")
require("conf.keys")

awful.screen.connect_for_each_screen(function(s)

    local barmenu = wibox.widget {
        awful.widget.launcher({ image = beautiful.launcher_icon,
                                menu = menu }),
        widget = wibox.container.margin,
        margins = 4 + beautiful.launcher_padding
    }
    local taglist = require("ui.bar.widgets.taglist")(s)
    local tasklist = require("ui.bar.widgets.tasklist")(s)
    local systray = require("ui.bar.widgets.systray")(s)
    local battery = nil; if laptop then battery = require("ui.bar.widgets.battery") end
    local volumebar = require("ui.bar.widgets.sliders.volume")(s)
    local kbdwidget = require("ui.bar.widgets.keyboard")
    local layouticon = helpers.embox(
        awful.widget.layoutbox {
            screen  = s,
            buttons = {
                awful.button({ }, 1, function () awful.layout.inc( 1) end),
                awful.button({ }, 3, function () awful.layout.inc(-1) end),
                awful.button({ }, 4, function () awful.layout.inc(-1) end),
                awful.button({ }, 5, function () awful.layout.inc( 1) end)
            },
        },
    false, 6, nil, false)
    local clock = require("ui.bar.widgets.clock")


    -- Create the wibox
    s.wibar = awful.wibar({
	    bg = "#00000000",
	    position = "left",
	    screen = s,
	    width = 36 + 2 * beautiful.border_size,
	    height = s.geometry.height - (2 * beautiful.useless_gap),
	    margins = {
		left   = beautiful.useless_gap,
		top    = beautiful.useless_gap,
		bottom = beautiful.useless_gap,
	    	right  = 0,
	    }
    })

    -- Add widgets to the wibox
    s.wibar:setup {
	widget = wibox.container.background,
	shape  = helpers.rrect(beautiful.border_radius),
	bg     = beautiful.lbg,
	{
	    widget  = wibox.container.margin,
	    margins = beautiful.border_size,
	    {
		widget = wibox.container.background,
		shape  = helpers.rrect(beautiful.border_radius - beautiful.border_size),
		bg     = beautiful.bg,
		{
	            layout = wibox.layout.align.vertical,
	            { -- Top widgets
	                layout = wibox.layout.fixed.vertical,
	                barmenu,
	                taglist
	            },
	            tasklist,
	            {
	                layout = wibox.layout.fixed.vertical,
	                systray,
			battery,
			helpers.embox({
			layout = wibox.layout.fixed.vertical,
			spacing = 2,
	                volumebar,
	                kbdwidget,
	                layouticon}, nil, 0, false),
	                clock,
	            }
		}
    	    }
	}
    }
end)
