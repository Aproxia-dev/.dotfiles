local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local helpers = require("helpers")

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
    if not c.fullscreen then
	c.shape = helpers.rrect(beautiful.border_radius)
    end
end)

client.connect_signal("request::geometry", function(c)
    if not c.fullscreen and not c.maximized then
	c.shape = helpers.rrect(beautiful.border_radius)
    else
	c.shape = function(cr,w,h)
	    gears.shape.rectangle(cr,w,h)
	end
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
-- }}}
