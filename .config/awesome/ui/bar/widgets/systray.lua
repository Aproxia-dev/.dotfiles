local helpers = require("helpers")
local wibox   = require("wibox")

return function(s)

    if s.index == 1 then
        local systray = helpers.embox(
            wibox.widget {
                widget = wibox.widget.systray,
                base_size = 20,
                horizontal = false,
            }, true)

        if awesome.systray() > 0 then
            systray.visible = true
        else
            systray.visible = false
        end

        awesome.connect_signal("systray::update", function()
            if awesome.systray() > 0 then
                systray.visible = true
            else
                systray.visible = false
            end
        end)

        return systray
    end
end

