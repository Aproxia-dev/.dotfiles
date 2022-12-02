local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")
local icons = require("icons")
local helpers = require("helpers")

require("signals.battery")

local batbar0 = wibox.widget {
	widget = wibox.widget.progressbar,
	background_color = "#00000000",
	max_value = 100,
	bar_shape = helpers.rrect(beautiful.border_radius / 2 - beautiful.border_size),
}

local batbar1 = wibox.widget {
	widget = wibox.widget.progressbar,
	background_color = "#00000000",
	max_value = 100,
	bar_shape = helpers.rrect(beautiful.border_radius / 2 - beautiful.border_size),
}

local battery_icon = wibox.widget {
	{
		{
			{
				{
					batbar0,
					batbar1,
			     		layout = wibox.layout.flex.vertical,
			     		spacing = 2,
			     		forced_height = 20
				},
				widget = wibox.container.rotate,
				direction = "east",
				forced_height = 20
			},
			layout = wibox.layout.stack
		},
		widget = wibox.container.margin,
		margins = beautiful.border_size
	},
	widget = wibox.container.background,
	shape = helpers.rrect(beautiful.border_radius / 2),
	border_width = beautiful.border_size,
	border_strategy = "inner",
}

local battery_notch = wibox.widget {
	{
		widget = wibox.container.background,
		id = "col",
	},
	widget = wibox.container.margin,
	forced_height = 2,
	margins = {
		top = 0,
		bottom = 0,
		left = 6,
		right = 6,
	}
}

local charging_icon = wibox.widget {
	{
		{
			{
				{
					widget = wibox.widget.imagebox,
					image = gears.color.recolor_image(icons.charging, beautiful.yellow),
					vertical_fit_policy = "fit",
				},
				widget = wibox.container.background,
				bg = beautiful.dbg,
				forced_height = 12,
				forced_width = 9,
				id = "bg"
			},
			widget = wibox.container.place,
			halign = "right",
			valign = "top",
			id = "place"
		},
		widget = wibox.container.background,
		forced_height = 15,
		forced_width = 12,
		shape = function(cr,w,h)
			return gears.shape.pie(cr,w,h,math.pi,math.pi/2)
		end,
		id = "shape"
	},
	widget = wibox.container.place,
	halign = "right",
	valign = "top"
}

local bat_widget = helpers.embox(wibox.widget {
	{
		{
			battery_notch,
			battery_icon,
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.margin,
		margins = 3
	},
	charging_icon,
	layout = wibox.layout.stack
})

local time_till_empty
local time_till_full

bat_widget:connect_signal("button::press", function()
	if not charging_icon.visible then
		naughty.notify { title = "Battery info", text = "Time until empty: " .. time_till_empty  }
	elseif charging_icon.visible then
		naughty.notify { title = "Battery info", text = "Time until full: " .. time_till_full }
	end
end)

bat_widget.shape.bgcol:connect_signal("property::bg", function(self, col)
	charging_icon.shape.place.bg:set_bg(col)
end)

awesome.connect_signal("signal::battery", function(bat0, bat1, charging, time_to_empty, time_to_full)
	local bat0color
	local bat1color

	if bat0 > 30 then bat0color = beautiful.green
	elseif bat0 > 10 then bat0color = beautiful.yellow
	else bat0color = beautiful.red end

	if bat1 > 30 then bat1color = beautiful.blue
	elseif bat1 > 10 then bat1color = beautiful.magenta
	else bat1color = beautiful.red end

	batbar0:set_value(bat0)
	batbar0:set_color(bat0color)
	batbar1:set_value(bat1)
	batbar1:set_color(bat1color)

	battery_icon:set_border_color({
		type = "linear",
		from = {0, 0},
		to = {20, 0},
		stops = {
			{0,   bat0color},
			{0.3, bat0color},
			{0.7, bat1color},
			{1,   bat1color}
		}
	})


	battery_notch.col:set_bg({
		type = "linear",
		from = {0, 0},
		to = {6, 0},
		stops = {
			{0,   bat0color},
			{1,   bat1color}
		}
	})

	charging_icon.visible = charging

	time_till_empty = math.floor(time_to_empty / 60) .. "h" .. time_to_empty % 60 .. "m"
	time_till_full  = math.floor(time_to_full / 60) .. "h" .. time_to_full % 60 .. "m"
end)

return bat_widget
