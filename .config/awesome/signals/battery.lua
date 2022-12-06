local upower = require("modules.battery_widget")

for _, path in pairs(upower.list_devices()) do

	upower({
		device_path = path,
		instant_update = true
	}):connect_signal("upower::update", function()
		local bat0 = upower.get_device("/org/freedesktop/UPower/devices/battery_BAT0")
		local bat1 = upower.get_device("/org/freedesktop/UPower/devices/battery_BAT1")
		local ac   = upower.get_device("/org/freedesktop/UPower/devices/line_power_AC")
	    
		local time_to_empty = (bat0.time_to_empty + bat1.time_to_empty) / 60
		local time_to_full  = (bat0.time_to_full + bat1.time_to_full) / 60

		awesome.emit_signal("signal::battery",
	        	tonumber(string.format("%.0f", bat0.percentage)),
	        	tonumber(string.format("%.0f", bat1.percentage)),
	        	ac.online,
	        	tonumber(string.format("%.0f", time_to_empty)),
	        	tonumber(string.format("%.0f", time_to_full))
		)
	end)
end
