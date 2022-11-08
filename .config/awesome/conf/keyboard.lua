local keyboard_layout = require("modules/keyboard_layout")
local icons = require("icons")

kbdcfg = keyboard_layout.kbdcfg({type = "gui"})
kbdcfg.add_primary_layout("English (Colemak)", icons.flag_us, "us(cmk_ed_us)")
kbdcfg.add_primary_layout("Czech (Colemak)",   icons.flag_cz, "cz(cmk_ed_ks)")
kbdcfg.bind()

