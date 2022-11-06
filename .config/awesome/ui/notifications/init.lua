local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local menubar = require("menubar")
local naughty = require("naughty")
local wibox = require("wibox")
local rubato = require("modules.rubato")
local icons = require("icons")
local helpers = require("helpers")

naughty.persistence_enabled = true
naughty.config.defaults.ontop = true
naughty.config.defaults.timeout = 4
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.position = "top_right"
-- naughty.config.icon_formats = { "png", "svg" }

--- Handle notification icon
naughty.connect_signal("request::icon", function(n, context, hints)
	--- Handle other contexts here
	if context ~= "app_icon" then
		return
	end

	--- Use XDG icon
	local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())

	if path then
		n.icon = path
	end
end)

--- Use XDG icon
naughty.connect_signal("request::action_icon", function(a, context, hints)
	a.icon = menubar.utils.lookup_icon(hints.id)
end)

naughty.connect_signal("request::display", function(n)
	local app_icons = {
		["firefox"] = { icon = "" },
		["discord"] = { icon = "ﭮ" },
		["spotify"] = { icon = "阮" },
	}
	local app_icon = nil
	if app_icons[string.lower(n.app_name)] then
		app_icon = app_icons[string.lower(n.app_name)].icon
	else
		app_icon = ""
	end

	local icon = wibox.widget {
		font = "JetBrainsMono Nerd Font Mono 18",
		markup = "<span foreground=\"" .. beautiful.accent .. "\">" .. app_icon .. "</span>",
		resize = true,
		halign = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	}

	local app_name = wibox.widget {
		widget = wibox.widget.textbox,
		font = beautiful.bfont,
		text = n.app_name:gsub("^%l", string.upper):gsub("%s%l", string.upper)
	}

	local x = wibox.widget {
		widget = wibox.widget.imagebox,
		image = gears.color.recolor_image(icons.closeicon, beautiful.accent),
	}

	local timeout_graph = wibox.widget {
		widget = wibox.container.arcchart,
		min_value = 0,
		max_value = 100,
		value = 0,
		thickness = 2,
		rounded_edge = true,
		colors = { beautiful.accent },
		bg = beautiful.lbg,
		x,
	}

	local title = wibox.widget {
		widget = wibox.container.scroll.horizontal,
		step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
		speed = 100,
		rate = 144,
		{
			widget = wibox.widget.textbox,
			font = beautiful.bfont,
			text = n.title,
		}
	}

	local message = wibox.widget {
		widget = wibox.container.scroll.horizontal,
		step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
		speed = 100,
		rate = 144,
		{
			widget = wibox.widget.textbox,
			font = beautiful.font,
			text = gears.string.xml_unescape(n.message),
		}
	}

	local image = wibox.widget {
		widget = wibox.widget.imagebox,
		image = n.image,
		clip_shape = gears.shape.rounded_rect,
		resize = true,
		halign = "center",
		valign = "center",
		forced_height = beautiful.get_font_height(beautiful.font) * 3
	}

	local widget = naughty.layout.box {
		notification = n,
		type = "notification",
		cursor = "hand2",
		shape = gears.shape.rectangle,
		bg = "#00000000",
		widget_template = {
			{
				{
					{
						{
							{
								{
									{
										{
											{
												icon,
												widget = wibox.container.margin,
												margins = {
													left = 4,
													right = 4,
													top = 2,
													bottom = 2,
												}
											},
											app_name,
											layout = wibox.layout.fixed.horizontal
										},
										nil,
										{
											timeout_graph,
											widget = wibox.container.margin,
											margins = 3,
										},
										layout = wibox.layout.align.horizontal,
										forced_height = 24,
									},
									widget = wibox.container.background,
									bg = beautiful.dbg
								},
								{
									{
										{
											image,
											{
												{
													title,
													message,
													layout = wibox.layout.flex.vertical
												},
												widget = wibox.container.margin,
												margins = {
													left = 4,
													right = 4
												}
											},
											layout = wibox.layout.fixed.horizontal
										},
										widget = wibox.container.margin,
										margins = 4
									},
									widget = wibox.container.background,
									bg = beautiful.bg,
								},
								layout = wibox.layout.fixed.vertical
							},
							widget = wibox.container.constraint,
							width = 300,
							height = 60,
							strategy = "min"
						},
						widget = wibox.container.constraint,
						width =  500,
						height = 150,
						strategy = "max"
					},
					widget = wibox.container.background,
					bg = beautiful.bg,
					shape = helpers.rrect(beautiful.border_radius - beautiful.border_size)
				},
				widget = wibox.container.margin,
				margins = beautiful.border_size
			},
			widget = wibox.container.background,
			bg = beautiful.accent,
			shape = helpers.rrect(beautiful.border_radius)
		}
	}

	local anim = rubato.timed {
		intro = 0,
		duration = n.timeout,
		subscribed = function(pos)
			timeout_graph.value = pos
		end
	}
	
	anim.target = 100
end)
