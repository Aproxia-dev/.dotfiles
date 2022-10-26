---------------------------
-- Default awesome theme --
---------------------------

local awful = require("awful")
local gc = require("gears.color")
local icons = require("icons")
local wibox = require("wibox")
local theme_assets = require("beautiful.theme_assets")
-- local xresources = require("beautiful.xresources")
-- local dpi = xresources.apply_dpi

local gfs        = require("gears.filesystem")
local conf_dir   = gfs.get_configuration_dir()
local themes_dir = conf_dir .. "themes/"
local theme_dir  = themes_dir .. theme

-- xresources.set_dpi(92, 1)
-- xresources.set_dpi(98, 2)
-- xresources.set_dpi(100, 3)

local theme = {}

theme.font          = "JetBrains Mono Nerd Font Mono 10"
theme.bfont         = "JetBrains Mono Nerd Font Mono Bold 10"

theme.black         = "#11111b"
theme.red           = "#f38ba8"
theme.green         = "#a6e3a1"
theme.yellow        = "#f9e2af"
theme.blue          = "#89dceb"
theme.magenta       = "#f5c2e7"
theme.cyan          = "#94e2d5"
theme.white         = "#cdd6f4"

theme.bg            = "#1e1e2e"
theme.fg            = theme.white
theme.dbg           = theme.black
theme.lbg           = "#313244"
theme.dfg           = "#6c7086"
theme.lfg           = "#f5e0dc"
theme.accent        = theme.magenta
theme.accentalt     = "#b4befe"
theme.alert         = theme.red

theme.bg_normal     = theme.bg
theme.bg_focus      = theme.lbg
theme.bg_urgent     = theme.alert
theme.bg_minimize   = theme.dbg

theme.fg_normal     = theme.fg
theme.fg_focus      = theme.lfg
theme.fg_urgent     = theme.bg
theme.fg_minimize   = theme.dbg

theme.taglist_bg_focus = theme.accent
theme.taglist_fg_empty = theme.dfg
theme.taglist_fg_occupied = theme.accent
theme.taglist_fg_focus = theme.bg

theme.useless_gap   = 8
theme.border_width  = 2
theme.border_normal = theme.lbg
theme.border_focus  = theme.accentalt
theme.border_marked = theme.alert
theme.bg_systray = theme.dbg
theme.systray_icon_spacing = 4

-- theme.menu_submenu_icon = themes_dir.."default/submenu.png"
theme.menu_height = 20
theme.menu_width  = 150

theme.layout_tile       = gc.recolor_image(icons.tile,       theme.accent)
theme.layout_tilebottom = gc.recolor_image(icons.tilebottom, theme.accent)
theme.layout_centered   = gc.recolor_image(icons.centered,   theme.accent)
theme.layout_fairv      = gc.recolor_image(icons.fairv,      theme.accent)
theme.layout_fairh      = gc.recolor_image(icons.fairh,      theme.accent)
theme.layout_floating   = gc.recolor_image(icons.floating,   theme.accent)
theme.layout_max        = wibox.widget.draw_to_image_surface (wibox.widget {
                                  wibox.widget.imagebox(gc.recolor_image(icons.max1, theme.accent)), 
                                  wibox.widget.imagebox(gc.recolor_image(icons.max2, theme.green )),
                              layout = wibox.layout.stack },
                          64, 64)

theme.launcher_icon     = theme_dir.."/bar/launchericon.png"

awful.spawn.with_shell("feh --bg-fill --no-xinerama " .. theme_dir .. "/wall.png")

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, "#585b70", theme.bg
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
