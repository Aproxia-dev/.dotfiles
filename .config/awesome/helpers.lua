local awful     = require("awful")
local beautiful = require("beautiful")
local gears     = require("gears")
local wibox     = require("wibox")

local helpers   = {}

helpers.rrect = function(rad)
	return function(cr,w,h)
		gears.shape.rounded_rect(cr,w,h,rad)
	end
end

helpers.embox = function(wgt, place_workaround)
	place_workaround = place_workaround or false
	if place_workaround == true then
	    wgt = wibox.widget {
		    wgt,
		    widget = wibox.container.place,
		    halign = "center",
		    valign = "center"
		}
	end
	return wibox.widget 
	{
	    {
	        {
	            {
                         wgt,
			 widget  = wibox.container.margin,
			 margins = 2
		    },
		    widget = wibox.container.background,
		    bg     = beautiful.black
		},
		widget = wibox.container.background,
		shape  = helpers.rrect(4)
	    },
	    widget  = wibox.container.margin,
	    margins = 4
	}
end


return helpers
