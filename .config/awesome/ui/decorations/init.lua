local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local bling = require("modules.bling")
local helpers = require("helpers")

local tabbed_misc = bling.widget.tabbed_misc

client.connect_signal("request::titlebars", function(c)

	awful.titlebar(c, {
		position = "left",
		size = beautiful.border_size,
		bg = beautiful.border_col_normal,
	})
	awful.titlebar(c, {
		position = "right",
		size = beautiful.border_size,
		bg = beautiful.border_col_normal,
	})
	awful.titlebar(c, {
		position = "top",
		size = 24,
		font = beautiful.bfont,
		bg = "#00000000"
	})
	:setup({
		{
			{
				{
					layout = wibox.layout.align.horizontal,
					{ -- Left
						awful.titlebar.widget.iconwidget(c),
						widget = wibox.container.margin,
						margins = {
							top = (24 - beautiful.iconsize)/2,
							bottom = (24 - beautiful.iconsize)/2,
							left = 3,
							right = 3,
						}

					},
					{ -- Middle
						layout = wibox.layout.flex.horizontal,
						buttons = {
							awful.button({
								modifiers = { },
								button = 1,
								on_press = function()
									c:activate { context = "mouse_click" }
									if not c.maximized then
										awful.mouse.client.move(c)
									end
								end,
							}),
							awful.button({
								modifiers = { },
								button = 2,
								on_press = function()
									c:activate { context = "mouse_click" }
									c.floating = not c.floating
								end,
							}),
							awful.button({
								modifiers = { },
								button = 3,
								on_press = function()
									c:activate { context = "mouse_click" }
									if not c.maximized then
										awful.mouse.client.resize(c)
									end
								end,
							}),
						},
						{
							widget = awful.titlebar.widget.titlewidget(c),
							align = "center",
							font = beautiful.bfont
						},
					},
					{
						{
							awful.titlebar.widget.maximizedbutton(c),
							widget = wibox.container.margin,
							margins = {
								top = (24 - beautiful.btnsize)/2,
								bottom = (24 - beautiful.btnsize)/2,
								left = 3,
								right = 3,
							}
						},
						{
						
							awful.titlebar.widget.minimizebutton(c),
							widget = wibox.container.margin,
							margins = {
								top = (24 - beautiful.btnsize)/2,
								bottom = (24 - beautiful.btnsize)/2,
								left = 3,
								right = 3,
							}
						},
						{
							awful.titlebar.widget.closebutton(c),
							widget = wibox.container.margin,
							margins = {
								top = (24 - beautiful.btnsize)/2,
								bottom = (24 - beautiful.btnsize)/2,
								left = 3,
								right = 3,
							}
						},
						layout = wibox.layout.align.horizontal
					}
				},
				widget = wibox.container.background,
				bg = beautiful.bg,
				shape = helpers.prrect(beautiful.border_radius - beautiful.border_size, true, true, false, false),
				id = "lmao"
			},
			widget = wibox.container.margin,
			top = beautiful.border_size,
			left = beautiful.border_size,
			right = beautiful.border_size,
			bottom = 0,
			id = "lol"
		},
		widget = wibox.container.background,
		shape = helpers.prrect(beautiful.border_radius, true, true, false, false),
		bg = beautiful.border_col_normal,
	})
	awful.titlebar(c, {
		position = "bottom",
		size = beautiful.border_radius * 2,
		bg = "#00000000"
	})
	:setup({
		{
			{
				tabbed_misc.titlebar_indicator(c, {
					bg_color = beautiful.bg,
					fg_color = beautiful.fg,
					bg_color_focus = beautiful.lbg,
					fg_color_focus = beautiful.accent,
					layout = wibox.layout.flex.horizontal,
					widget_template = {
						{
							{
								{
									widget = awful.widget.clienticon,
									id = "icon_role",
								},
								widget = wibox.container.margin,
								margins = 2
							},
							{
								widget = wibox.widget.textbox,
								id = "text_role",
								align = "center"
							},
							nil,
							layout = wibox.layout.align.horizontal,
						},
						widget = wibox.container.background,
						id = "bg_role",
					},
				}),
				widget = wibox.container.background,
				bg = beautiful.bg,
				shape = helpers.prrect(beautiful.border_radius - beautiful.border_size, false, false, true, true),
				id = "lmao"
			},
			widget = wibox.container.margin,
			bottom = beautiful.border_size,
			left = beautiful.border_size,
			right = beautiful.border_size,
			top = 0,
			id = "lol"
		},
		widget = wibox.container.background,
		shape = helpers.prrect(beautiful.border_radius, false, false, true, true),
		bg = beautiful.border_col_normal,
	})

	awesome.connect_signal("bling::tabbed::update", function(obj)
		if #obj.clients == 1 or nil then
			for _, c in ipairs(obj.clients) do
				awful.titlebar(c, { position = "bottom", size = beautiful.border_radius * 2 })
			end
		elseif #obj.clients > 1 then
			for _, c in ipairs(obj.clients) do
				awful.titlebar(c, { position = "bottom", size = 30 })
			end
		end
	end)
	
	awesome.connect_signal("bling::tabbed::client_removed", function(obj, c)
		awful.titlebar(c, { position = "bottom", size = beautiful.border_radius * 2 })
	end)
	
	local tabcheck = function(c)
		if c.bling_tabbed == nil then
			return beautiful.border_radius * 2
		else
			if #c.bling_tabbed.clients == 1 then
				bling.module.tabbed.remove(c)
				return beautiful.border_radius * 2
			else
				return 30
			end
		end
	end

	client.connect_signal("focus", function(c)
		local bs = tabcheck(c)
		if c.requests_no_titlebar ~= true then
			awful.titlebar(c, { position = "left",   bg = beautiful.border_col_focus, size = beautiful.border_size })
			awful.titlebar(c, { position = "right",  bg = beautiful.border_col_focus, size = beautiful.border_size })
			awful.titlebar(c, { position = "top",    size = 24 }).widget.bg = beautiful.border_col_focus 
			awful.titlebar(c, { position = "bottom", size = bs }).widget.bg = beautiful.border_col_focus
		end
	end)

	client.connect_signal("unfocus", function(c)
		local bs = tabcheck(c)
		if c.requests_no_titlebar ~= true then
			awful.titlebar(c, { position = "left",   bg = beautiful.border_col_normal, size = beautiful.border_size })
			awful.titlebar(c, { position = "right",  bg = beautiful.border_col_normal, size = beautiful.border_size })
			awful.titlebar(c, { position = "top",    size = 24 }).widget.bg = beautiful.border_col_normal 
			awful.titlebar(c, { position = "bottom", size = bs }).widget.bg = beautiful.border_col_normal
		end
	end)

	client.connect_signal("request::geometry", function(c)
		local bs = tabcheck(c)
		if c.requests_no_titlebar ~= true then
			if c.maximized then
				awful.titlebar(c, { position = "top",    size = 24 }).widget.shape          = helpers.rect()
				awful.titlebar(c, { position = "top",    size = 24 }).widget.lol.lmao.shape = helpers.rect()
				awful.titlebar(c, { position = "bottom", size = bs }).widget.shape          = helpers.rect()
				awful.titlebar(c, { position = "bottom", size = bs }).widget.lol.lmao.shape = helpers.rect()
			else
				awful.titlebar(c, { position = "top",    size = 24 }).widget.shape          = helpers.prrect(beautiful.border_radius, true, true, false, false)
				awful.titlebar(c, { position = "top",    size = 24 }).widget.lol.lmao.shape = helpers.prrect(beautiful.border_radius, true, true, false, false)
				awful.titlebar(c, { position = "bottom", size = bs }).widget.shape          = helpers.prrect(beautiful.border_radius, false, false, true, true)
				awful.titlebar(c, { position = "bottom", size = bs }).widget.lol.lmao.shape = helpers.prrect(beautiful.border_radius, false, false, true, true)
			end
		end
	end)
end)



