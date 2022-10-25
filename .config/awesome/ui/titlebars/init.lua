local nice = require("modules.nice")
local beautiful = require("beautiful")

nice {
    titlebar_color = beautiful.bg_normal,
    titlebar_height = 24,
    titlebar_radius = 0,
    titlebar_margin_left = 4,
    titlebar_margin_right = 3,
    titlebar_font = beautiful.bfont,
    win_shade_enabled = false,
    color_theme = theme,

    titlebar_items = {
        left = "icon",
        middle = "title",
        right = { "maximize", "floating", "close" }
    },

    button_size = 12,
    button_shape = "diamond",
    button_margin_horizontal = 3,
    button_margin_top = 1,

    icon_size = 16,
    icon_margin = 8,

    close_color    = beautiful.red,
    floating_color = beautiful.blue,
    maximize_color = beautiful.green,
}
