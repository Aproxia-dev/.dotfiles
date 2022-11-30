local keyboard_layout = require("modules/keyboard_layout")
local icons = require("icons")

kbdcfg = keyboard_layout.kbdcfg({
	type = "tui",
	tui_wrap_left = "",
	tui_wrap_right = ""
})
kbdcfg.add_primary_layout("English (Colemak)", "EN", "us(cmk_ed_us)")
kbdcfg.add_primary_layout("Czech (Colemak)",   "CZ", "cz(cmk_ed_ks)")
kbdcfg.bind()

