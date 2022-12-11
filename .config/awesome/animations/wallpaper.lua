local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local rubato = require("modules.rubato")

awful.screen.connect_for_each_screen(function(s)

	s.wyoom = wibox {
		visible = false,
		input_passthrough = true,
		screen = s,
		width = s.geometry.width,
		height = s.geometry.height,
		bg = "#00000000",
		desktop = true,
		type = "desktop",
		widget = {
			widget = wibox.widget.imagebox,
			forced_width = s.geometry.width,
			forced_height = s.geometry.height,
		}
	}
end)

return function()
	-- local wall = gears.filesystem.get_random_file_from_dir(os.getenv("HOME") .. "/Pictures/Wallpapers/", { "jpg", "png" }, true)
	local wall = "/home/apro/.config/awesome/funnywall.jpg"
	local s = mouse.screen

	local start_pos = {
		x = math.random(0, s.geometry.width),
		y = math.random(0, s.geometry.height),
		-- x = s.geometry.width/2,
		-- y = s.geometry.height/2,
	}

	local path_to_corner = math.sqrt(math.max(start_pos.x, s.geometry.width  - start_pos.x) ^ 2 + math.max(start_pos.y, s.geometry.height - start_pos.y) ^ 2)

	local function clip(cr, x, y, size)
		cr:arc(x, y, size, 0, math.rad(360))
		cr:close_path()
	end

	s.wyoom.widget:set_image(wall)

	local anim = rubato.timed {
		duration = 1,
		intro = 0,
		outro = 1,
		easing = rubato.quadratic,
		override_dt = true,
		pos = 1,
		subscribed = function(pos, time)
			s.wyoom.widget:set_clip_shape(function(cr) clip(cr, start_pos.x, start_pos.y, pos) end)
			if time == 1 then
				awful.wallpaper { screen = s, widget = s.wyoom.widget }
    				gears.timer {
    				    timeout = 0.1,
    				    call_now  = false,
    				    autostart = true,
    				    single_shot = true,
				    callback = function()
					s.wyoom.visible = false
				    end
				}
			end
		end
	}

	anim.target = path_to_corner
	s.wyoom.visible = true
end
