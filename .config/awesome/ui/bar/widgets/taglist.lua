local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")

local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                             if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
                )

return function(s)
    local taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout  = wibox.layout.fixed.vertical,
        widget_template = {
            {
		{
                    {
                        {
                            id     = "text_role",
                            widget = wibox.widget.textbox,
                            align  = "center",
                            valign = "center"
                        },
                        widget  = wibox.container.margin,
                        margins = 1,
                    },
                    id     = "background_role",
                    widget = wibox.container.background
                },
                shape = gears.shape.circle,
                widget = wibox.container.background
            },
            widget = wibox.container.margin,
            margins = 2
        }
    }

    return helpers.embox(taglist) 
end

