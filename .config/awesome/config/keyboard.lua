local keyboard_layout = require("modules/keyboard_layout")
local icons = require("icons")

kbdcfg = keyboard_layout.kbdcfg({type = "gui"})
kbdcfg.add_primary_layout("English (US)",   icons.flag_us, "us")
kbdcfg.add_primary_layout("Czech (qwerty)", icons.flag_cz, "cz(qwerty)")
kbdcfg.bind()

