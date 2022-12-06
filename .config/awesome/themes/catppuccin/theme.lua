-------------------------------------
-- Apro's awesome catppuccin theme --
-------------------------------------

local awful = require("awful")
local gc = require("gears.color")
local icons = require("icons")
local wibox = require("wibox")
local theme_assets = require("beautiful.theme_assets")
local helpers = require("helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs        = require("gears.filesystem")
local color      = require("modules.color")
local conf_dir   = gfs.get_configuration_dir()
local themes_dir = conf_dir .. "themes/"
local theme_dir  = themes_dir .. Theme

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

theme.border_col_normal = theme.lbg
theme.border_col_focus  = theme.accentalt

theme.taglist_bg_focus = theme.accent
theme.taglist_fg_empty = theme.dfg
theme.taglist_fg_occupied = theme.accent
theme.taglist_fg_focus = theme.bg

theme.useless_gap = 8
theme.border_radius = 6
theme.border_size = 2
theme.border_width = 0
theme.btnsize = 16
theme.iconsize = 20
theme.bg_systray = theme.dbg
theme.systray_icon_spacing = 4

theme.tabbar_disable = true
theme.mstab_bar_padding = theme.useless_gap
theme.mstab_border_radius = theme.border_radius
theme.mstab_tabbar_style = "boxes"

-- theme.menu_submenu_icon = themes_dir.."default/submenu.png"
theme.menu_height = 20
theme.menu_width  = 150

theme.layout_tile       = gc.recolor_image(icons.tile,       theme.accent)
theme.layout_tilebottom = gc.recolor_image(icons.tilebottom, theme.accent)
theme.layout_centered   = gc.recolor_image(icons.centered,   theme.accent)
theme.layout_mstab      = gc.recolor_image(icons.mstab,      theme.accent)
theme.layout_fairv      = gc.recolor_image(icons.fairv,      theme.accent)
theme.layout_fairh      = gc.recolor_image(icons.fairh,      theme.accent)
theme.layout_floating   = gc.recolor_image(icons.floating,   theme.accent)
theme.layout_max        = helpers.combine(icons.max1, theme.accent, icons.max2, theme.green)

theme.titlebar_close_button_normal              = gc.recolor_image(icons.btn, theme.dfg)
theme.titlebar_close_button_focus               = gc.recolor_image(icons.btn, theme.red)
theme.titlebar_minimize_button_normal           = gc.recolor_image(icons.btn, theme.dfg)
theme.titlebar_minimize_button_focus            = gc.recolor_image(icons.btn, theme.yellow)
theme.titlebar_maximized_button_normal_inactive = gc.recolor_image(icons.btn, theme.dfg)
theme.titlebar_maximized_button_focus_inactive  = gc.recolor_image(icons.btn, theme.green)
theme.titlebar_maximized_button_focus_active    = helpers.combine(icons.btn, theme.green, icons.maxicon, theme.bg)
theme.titlebar_maximized_button_normal_active   = helpers.combine(icons.btn, theme.green, icons.maxicon, theme.bg)

theme.titlebar_close_button_focus_hover               = helpers.combine(icons.btn, (color.color { hex = theme.red    } + "0.1l").hex, icons.closeicon, theme.bg)
theme.titlebar_close_button_normal_hover              = helpers.combine(icons.btn, (color.color { hex = theme.red    } + "0.1l").hex, icons.closeicon, theme.bg)
theme.titlebar_minimize_button_focus_hover            = helpers.combine(icons.btn, (color.color { hex = theme.yellow } + "0.1l").hex, icons.minicon,   theme.bg)
theme.titlebar_minimize_button_normal_hover           = helpers.combine(icons.btn, (color.color { hex = theme.yellow } + "0.1l").hex, icons.minicon,   theme.bg)
theme.titlebar_maximized_button_focus_active_hover    = helpers.combine(icons.btn, (color.color { hex = theme.green  } + "0.1l").hex, icons.maxicon,   theme.bg)
theme.titlebar_maximized_button_normal_active_hover   = helpers.combine(icons.btn, (color.color { hex = theme.green  } + "0.1l").hex, icons.maxicon,   theme.bg)
theme.titlebar_maximized_button_focus_inactive_hover  = helpers.combine(icons.btn, (color.color { hex = theme.green  } + "0.1l").hex, icons.maxicon,   theme.bg)
theme.titlebar_maximized_button_normal_inactive_hover = helpers.combine(icons.btn, (color.color { hex = theme.green  } + "0.1l").hex, icons.maxicon,   theme.bg)

theme.launcher_icon    = theme_dir.."/bar/launchericon.png"
theme.launcher_padding = 0

awful.spawn.with_shell("feh --bg-fill --no-xinerama " .. theme_dir .. "/wall.png")

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
