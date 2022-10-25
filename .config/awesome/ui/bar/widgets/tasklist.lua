local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")

local tasklist_buttons = gears.table.join(
                awful.button({ }, 1, function (c)
                                         if c == client.focus then
                                             c.minimized = true
                                         else
                                             c:emit_signal(
                                                 "request::activate",
                                                 "tasklist",
                                                 {raise = true}
                                             )
                                         end
                                     end),
                awful.button({ }, 3, function () awful.menu.client_list({ theme = { width = 300 } }) end),
                awful.button({ }, 4, function () awful.client.focus.byidx( 1) end),
                awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)
return function(s)
    tasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = { valign = "center" },
        layout  = {
            spacing = 8,
            layout = wibox.layout.fixed.vertical
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = "icon_role",
                                widget = wibox.widget.imagebox
                            },
                            widget = wibox.container.margin,
                            margins = 3
                        },
                        id = "background_role",
                        widget = wibox.container.background
                    },
            	    shape  = helpers.rrect(4),
                    widget = wibox.container.background
                },
                widget = wibox.container.margin,
                left = 5,
                right = 5,
                up = 2,
                down = 2
            },
            widget = wibox.container.background
        }
    }
    return tasklist
end

