local gfs = require("gears.filesystem")
local dir = gfs.get_configuration_dir() .. "icons/"

icons = {
	-- window layouts
	tile       = dir .. "layouts/tile.png",
	tilebottom = dir .. "layouts/tilebottom.png",
	centered   = dir .. "layouts/centered.png",
	fairv      = dir .. "layouts/fairv.png",
	fairh      = dir .. "layouts/fairh.png",
	floating   = dir .. "layouts/floating.png",
	max1       = dir .. "layouts/max1.png",
	max2       = dir .. "layouts/max2.png",

	-- keyboard layouts
	flag_cz    = dir .. "kblayouts/flag_cz.svg",
	flag_us    = dir .. "kblayouts/flag_us.svg",
	flag_de    = dir .. "kblayouts/flag_de.svg",
	flag_es    = dir .. "kblayouts/flag_es.svg",
	flag_fr    = dir .. "kblayouts/flag_fr.svg",
	flag_ru    = dir .. "kblayouts/flag_ru.svg",
	flag_jp    = dir .. "kblayouts/flag_jp.svg",

}

return icons
