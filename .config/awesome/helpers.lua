local awful     = require("awful")
local beautiful = require("beautiful")
local gears     = require("gears")
local wibox     = require("wibox")
local color     = require("modules.color")
local rubato    = require("modules.rubato")
local naughty   = require("naughty")

local helpers   = {}

helpers.rrect = function(rad)
	return function(cr,w,h)
		gears.shape.rounded_rect(cr,w,h,rad)
	end
end

helpers.embox = function(wgt, plfix, padding, hover)
	local plfix = plfix or false
	local padding = padding or 2
	if plfix == true then
	    wgt = wibox.widget {
		    wgt,
		    widget = wibox.container.place,
		    halign = "center",
		    valign = "center"
		}
	end
	local boxed = wibox.widget 
	{
	    {
	        {
	            {
                         wgt,
			 widget  = wibox.container.margin,
			 margins = padding
		    },
		    widget = wibox.container.background,
		    bg     = beautiful.dbg,
		    id     = "bgcol"
		},
		widget = wibox.container.background,
		shape  = helpers.rrect(4),
		id     = "shape"
	    },
	    widget  = wibox.container.margin,
	    margins = 4
	}

	if hover ~= false then
		local dbg = color.color { hex = beautiful.dbg }
		local lbg = color.color { hex = beautiful.lbg }
		
		local boxtrans = color.transition(dbg, lbg)
		local boxanim = rubato.timed {
			duration   = 0.2,
			intro      = 0.1,
			subscribed = function(pos) boxed.shape.bgcol.bg = boxtrans(pos).hex end
		}
		
		
		boxed.shape:connect_signal("mouse::enter", function()
			boxanim.target = 1
		end)
		
		boxed.shape:connect_signal("mouse::leave", function()
			boxanim.target = 0
		end)
	end
	
	return boxed
end


return helpers
