local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")
local rubato = require("modules.rubato")
local color = require("modules.color")
local helpers = require("helpers")

return function(s)
    local volbar = wibox.widget {
        {
            {
                {
                    {
                        id               = "vol",
                        widget           = wibox.widget.slider,
                        bar_shape        = gears.shape.rounded_rect,
                        bar_height       = 4,
                        bar_color        = beautiful.lbg,
                        bar_active_color = beautiful.accent,
                        handle_color     = beautiful.accent,
                        handle_shape     = gears.shape.circle,
                        handle_width     = 4,
                        maximum          = 100,
                        minimum          = 0,
                        forced_width     = 80,
                    },
                    id        = "rotate",
                    widget    = wibox.container.rotate,
                    direction = "east"
                },
                id     = "margin",
                widget = wibox.container.margin,
                top    = 8,
		bottom = 8
            },
            id       = "reveal",
            widget   = wibox.container.constraint,
            strategy = "max",
            height   = 0
        },
        {
	    {
	        {
                    widget = wibox.widget.textbox,
                    markup = "<span foreground='" .. beautiful.accent .. "'>墳</span>",
                    align  = "center",
                    valign = "center",
                    font   = "JetBrains Mono Nerd Font Mono 18",
	            forced_height = 28
                },
	        widget = wibox.container.background,
	        id     = "bgcol"
	    },
	    widget = wibox.container.background,
	    shape  = helpers.rrect(4),
	    id     = "shape"
    	},
        layout = wibox.layout.fixed.vertical
    }

    local vol = volbar.reveal.margin.rotate.vol

    volbar:buttons(gears.table.join(
        awful.button({ }, 4, function() vol:set_value(vol.value+5) end),
        awful.button({ }, 5, function() vol:set_value(vol.value-5) end))
    )

    volbar.shape:buttons(gears.table.join(
        awful.button({ }, 1, function() awful.spawn.with_shell("kitty -e pulsemixer") end))
    )

    local volume_slide = rubato.timed {
        pos        = 0,
        duration   = 0.5,
        intro      = 0,
        outro      = 0.4,
        easing     = rubato.quadratic,
        subscribed = function(pos) volbar.reveal:set_height(pos) end
    }

    volbar:connect_signal("mouse::enter", function()
        awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
        vol:set_value(tonumber(stdout)) end)
        volume_slide.target = 80
    end)

    volbar:connect_signal("mouse::leave", function()
        volume_slide.target = 0
    end)

    local dbg = color.color { hex = beautiful.dbg }
    local lbg = color.color { hex = beautiful.lbg }

    local btntrans = color.transition(dbg, lbg)
    local btnanim = rubato.timed {
	    duration = 0.2,
	    intro    = 0.1,
	    subscribed = function(pos) volbar.shape.bgcol.bg = btntrans(pos).hex end
    }

    volbar.shape:connect_signal("mouse::enter", function()
        btnanim.target = 1
    end)

    volbar.shape:connect_signal("mouse::leave", function()
        btnanim.target = 0
    end)

    vol:connect_signal("property::value", function()
	awful.spawn.with_shell("pamixer --set-volume " .. vol:get_value())
    end)
    return helpers.embox(volbar, false, 0, false)
end
