local beautiful = require("beautiful")
local helpers   = require("helpers")
local wibox     = require("wibox")

local clock = wibox.widget {
         {
             {
                 format  = "%I",
                 refresh = 1,
                 widget  = wibox.widget.textclock,
                 align   = "center",
                 valign  = "center",
             },
             {
                 format  = "%M",
                 refresh = 1,
                 widget  = wibox.widget.textclock,
                 align   = "center",
                 valign  = "center",
             },
             layout = wibox.layout.fixed.vertical,
             widget = wibox.container.background,
             fg     = beautiful.white,
         },
         {
             {
                 format  = "%p",
                 refresh = 1,
                 widget  = wibox.widget.textclock,
                 align   = "center",
                 valign  = "center",
             },
             widget = wibox.container.background,
             fg     = beautiful.red,
         },
         layout = wibox.layout.fixed.vertical,
     }
return helpers.embox(clock)
