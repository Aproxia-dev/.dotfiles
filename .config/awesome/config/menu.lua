local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- {{{ Menu
-- Create a launcher widget and a main menu

funmenu = {
	{ "minecraft", function() awful.spawn.with_shell("polymc") end },
	{ "osu", function() awful.spawn.with_shell("env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/1") end },
	{ "steam", function() awful.spawn.with_shell("/usr/bin/steam-runtime") end },
	{ "lutris", function() awful.spawn.with_shell("lutris") end },
	{ "music", function() awful.spawn.with_shell(music) end },
}

commmenu = {
	{ "discord", function() awful.spawn.with_shell("/usr/bin/discord") end },
	{ "mail client", function() awful.spawn.with_shell(mail) end },
}

awesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "edit config", termfiles_cmd .. " " .. gears.filesystem.get_configuration_dir() },
	{ "reload config", awesome.restart },
	-- { "quit", function() awesome.quit() end },
}

powermenu = {
	{ "shutdown", function() awful.spawn.with_shell("shutdown -h now") end },
	{ "reboot", function() awful.spawn.with_shell("shutdown -r now") end },
	{ "suspend", function() awful.spawn.with_shell("betterlockscreen -l dimblur --span --display 1 & systemctl suspend") end },
	{ "lock screen", function() awful.spawn.with_shell("notify-send 'Not working yet!' \"You're gonna have to wait for this to work!\"") end },
	{ "log out", function() awesome.quit() end },
}

menu = awful.menu({ items = {
		{ "launcher", function() awful.spawn.with_shell("sleep 0.1 && rofi -show drun") end },
		{ "terminal", terminal },
		{ "web browser", browser },
		{ "file manager", files },
		{ "entertainment", funmenu },
		{ "communication", commmenu },
		{ "awesome", awesomemenu, beautiful.awesome_icon },
		{ "powermenu", powermenu }
	}
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
