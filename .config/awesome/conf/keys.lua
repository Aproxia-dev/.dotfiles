-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful")
local tabbed = require("modules.bling.module.tabbed")
local screenshot = require("modules.screenshot")
screenshot.init(os.getenv("HOME") .. "/.screenshots/", "AweShot-", beautiful.black)

require("conf.menu")

modkey = "Mod4"

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey,           }, "#61",      hotkeys_popup.show_help,
		{description="show help", group="awesome"}),
	
	awful.key({ modkey,           }, "l",
		function ()
			awful.client.focus.byidx( 1)
		end,
		{description = "focus next/prev by index", group = "client"}
	),
	awful.key({ modkey,           }, "u",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{description = "focus next/prev by index", group = "client"}
	),
	
	-- Prompt
	awful.key({ modkey            }, "r",     function () awful.spawn.with_shell("rofi -show drun") end,
	          {description = "run launcher", group = "rofi"}),
	awful.key({ modkey, "Shift"   }, "r",     function () awful.spawn.with_shell("rofi -show run -config /home/apro/.config/rofi/run.rasi") end,
	          {description = "run command prompt", group = "rofi"}),
	
	-- Layout manipulation
	awful.key({ modkey, "Shift"   }, "l",      function () awful.client.swap.byidx(  1)		end,
		  {description = "swap with prev/next client by index", group = "client"}),
	awful.key({ modkey, "Shift"   }, "u",      function () awful.client.swap.byidx( -1)		end,
	          {description = "swap with prev/next client by index", group = "client"}),
	awful.key({ modkey,           }, "period", function () awful.screen.focus_relative( 1)		end,
	          {description = "focus the prev/next screen", group = "screen"}),
	awful.key({ modkey,           }, "comma",  function () awful.screen.focus_relative(-1)		end,
	          {description = "focus the prev/next screen", group = "screen"}),
	awful.key({ modkey,           }, "space",  function () awful.client.setmaster(client.focus)	end,
	          {description = "move client to the top of the stack", group = "client"}),
	
	-- Standard program
	awful.key({ modkey,           }, "Return", function () awful.spawn(terminal)			end,
	          {description = "open a terminal", group = "launch"}),
	awful.key({ modkey,           }, "w",      function () awful.spawn(browser)			end,
	          {description = "open a web browser", group = "launch"}),
	awful.key({ modkey,           }, "m",      function () awful.spawn(mail)			end,
	          {description = "open a mail client", group = "launch"}),
	awful.key({ modkey,           }, "e",      function () awful.spawn(files)			end,
	          {description = "open a file manager", group = "launch"}),
	awful.key({ modkey, "Shift"   }, "e",      function () awful.spawn(termfiles_cmd)		end,
	          {description = "open a terminal file manager", group = "launch"}),
	awful.key({ modkey,           }, "s",      function () awful.spawn(music)			end,
	          {description = "open a music player", group = "launch"}),
	awful.key({ modkey,           }, "g",      function () awful.spawn(emoji_picker)		end,
	          {description = "open an emoji picker", group = "launch"}),
		  
	awful.key({ modkey, "Control" }, "r", awesome.restart,
	          {description = "reload awesome", group = "awesome"}),
	awful.key({ modkey,           }, "BackSpace", awesome.quit,
	          {description = "quit awesome", group = "awesome"}),
	
	awful.key({ modkey,           }, "j",     function () awful.tag.incmwfact(-0.05)		  end,
	          {description = "inc/decrease master width factor", group = "layout"}),
	awful.key({ modkey,           }, "y",     function () awful.tag.incmwfact( 0.05)		  end,
	          {description = "inc/decrease master width factor", group = "layout"}),
	awful.key({ modkey, "Shift"   }, "j",     function () awful.tag.incnmaster( 1, nil, true)	  end,
	          {description = "inc/decrease the number of master clients", group = "layout"}),
	awful.key({ modkey, "Shift"   }, "y",     function () awful.tag.incnmaster(-1, nil, true)	  end,
	          {description = "inc/decrease the number of master clients", group = "layout"}),
	awful.key({ modkey, "Control" }, "j",     function () awful.tag.incncol( 1, nil, true)		  end,
	          {description = "inc/decrease the number of columns", group = "layout"}),
	awful.key({ modkey, "Control" }, "y",     function () awful.tag.incncol(-1, nil, true)		  end,
	          {description = "inc/decrease the number of columns", group = "layout"}),
	awful.key({ modkey, "Control" }, "l", function () awful.layout.inc(  1)				  end,
		  {description = "change to the prev/next layout", group = "layout"}),
	awful.key({ modkey, "Control" }, "u", function () awful.layout.inc( -1)				  end,
	          {description = "change to the prev/next layout", group = "layout"}),
	
	awful.key({ modkey, "Shift" }, "x",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
	        		c:emit_signal(
	                	"request::activate", "key.unminimize", {raise = true}
	        		)
	        	end
	        end,
	        {description = "restore minimized", group = "flags"}),
	awful.key({ modkey           }, "a", function () kbdcfg.switch_next() end,
		  {description = "switch keyboard layout", group = "keyboard"}),
---	Windows' legacy keyboard switching keybinds
--	   These can mess with DreymaR's extend layer quite a bit so I keep it disabled
--
--	awful.key({ "Mod1"           }, "Shift_L", function () kbdcfg.switch_next() end,
--		  {description = "switch keyboard layout", group = "keyboard"}),
--	awful.key({ "Shift"          }, "Alt_L", function () kbdcfg.switch_next() end),
	awful.key({ scrkey.mod            }, scrkey.key, function ()
						local sht = screenshot.screen() 
						awful.spawn("xclip -selection clipboard " .. sht .. " -t image/png")
					  	end,
		  {description = "take a screenshot of the monitor", group = "screenshot"}),
	awful.key({ "Control", scrkey.mod }, scrkey.key, function () awful.spawn.with_shell("scrot -fs -e 'xclip -selection clipboard -t image/png < $f && mv $f ~/.screenshots/' --line style=solid,mode=edge '%Y-%m-%d-%H.%M.%S_$wx$h.png'") end,
		  {description = "take a screenshot of the selected area", group = "screenshot"}),
	awful.key({ modkey, "Shift"  }, "s", function () awful.spawn.with_shell("scrot -fs -e 'xclip -selection clipboard -t image/png < $f && mv $f ~/.screenshots/' --line style=solid,mode=edge '%Y-%m-%d-%H.%M.%S_$wx$h.png'") end,
		  {description = "take a screenshot of the selected area", group = "screenshot"}),

	awful.key({ modkey,          }, "t", function () tabbed.pick_with_dmenu("rofi -dmenu -p \"Tabbed\" -config ~/.config/rofi/run.rasi -i") end,
		  {description = "add a client to a tabbing group", group = "tabs"}),
	awful.key({ modkey, "Shift"  }, "t", function () tabbed.pop() end,
		  {description = "remove a client from a tabbing group", group = "tabs"}),
	awful.key({ modkey,          }, "n", function () tabbed.iter( 1) end,
		  {description = "iterate through tabs", group = "tabs"}),
	awful.key({ modkey,          }, "p", function () tabbed.iter(-1) end,
		  {description = "iterate through tabs", group = "tabs"}),
	awful.key({ modkey, "Shift"  }, "n", function () tabbed.iter(-1) end,
		  {description = "iterate through tabs", group = "tabs"}),
	awful.key({ modkey, "Shift"  }, "p", function () tabbed.iter( 1) end,
		  {description = "iterate through tabs", group = "tabs"}),

	-- Window management
	awful.key({ modkey,          }, "Left",  function() awful.client.focus.global_bydirection("left",  client.focus) end,
		  {description = "focus on a client directionally", group = "client"}),
	awful.key({ modkey,          }, "Down",  function() awful.client.focus.global_bydirection("down",  client.focus) end,
		  {description = "focus on a client directionally", group = "client"}),
	awful.key({ modkey,          }, "Up",    function() awful.client.focus.global_bydirection("up",    client.focus) end,
		  {description = "focus on a client directionally", group = "client"}),
	awful.key({ modkey,          }, "Right", function() awful.client.focus.global_bydirection("right", client.focus) end,
		  {description = "focus on a client directionally", group = "client"}),
	awful.key({ modkey, "Shift"  }, "Left",  function() awful.client.swap.global_bydirection("left",  client.focus) end,
		  {description = "swap clients by direction", group = "client"}),
	awful.key({ modkey, "Shift"  }, "Down",  function() awful.client.swap.global_bydirection("down",  client.focus) end,
		  {description = "swap clients by direction", group = "client"}),
	awful.key({ modkey, "Shift"  }, "Up",    function() awful.client.swap.global_bydirection("up",    client.focus) end,
		  {description = "swap clients by direction", group = "client"}),
	awful.key({ modkey, "Shift"  }, "Right", function() awful.client.swap.global_bydirection("right", client.focus) end,
		  {description = "swap clients by direction", group = "client"})
)
	
clientkeys = gears.table.join(
	awful.key({ modkey,           }, "f",
		function (c)
	        	c.fullscreen = not c.fullscreen
	        	c:raise()
	    	end,
		{description = "toggle fullscreen", group = "flags"}),
	awful.key({ modkey,           }, "q",      function (c) c:kill()				end,
	          {description = "close", group = "client"}),
	awful.key({ modkey, "Shift"   }, "space",  awful.client.floating.toggle                     	,
	          {description = "toggle floating", group = "flags"}),
	awful.key({ modkey, "Shift"   }, "comma",  function (c) c:move_to_screen(c.screen.index-1)	end,
	          {description = "move to prev/next screen", group = "client"}),
	awful.key({ modkey, "Shift"   }, "period", function (c) c:move_to_screen(c.screen.index+1)	end,
	          {description = "move to prev/next screen", group = "client"}),
	awful.key({ modkey,           }, "c",
		function (c)
			c.maximized = not c.maximized
	        c:raise()
	    end,
	    {description = "(un)maximize", group = "flags"}),
	awful.key({ modkey,           }, "x",
		function (c)
	        -- The client currently has the input focus, so it cannot be
	        -- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end,
		{description = "minimize", group = "flags"}),
	awful.key({ modkey,           }, "d",      function (c) c.ontop = not c.ontop			end,
	          {description = "toggle keep on top", group = "flags"}),
	awful.key({ modkey,           }, "b",      function () 
							local s = awful.screen.focused()
							s.wibar.visible = not s.wibar.visible	end,
		  {description = "toggle bar", group = "flags"})
)	
	-- Find all key numbers to tags.
	-- Be careful: we use keycodes to make it work on any keyboard layout.
	-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 6 do
	globalkeys = gears.table.join(globalkeys,
	    -- View tag only.
	    awful.key({ modkey }, "#" .. i + 9,
	              function ()
	                    local screen = awful.screen.focused()
	                    local tag = screen.tags[i]
	                    if tag then
	                       tag:view_only()
	                    end
	              end,
	              {description = "view tag", group = "tag"}),
	    -- Toggle tag display.
	    awful.key({ modkey, "Control" }, "#" .. i + 9,
	              function ()
	                  local screen = awful.screen.focused()
	                  local tag = screen.tags[i]
	                  if tag then
	                     awful.tag.viewtoggle(tag)
	                  end
	              end,
	              {description = "toggle tag", group = "tag"}),
	    -- Move client to tag.
	    awful.key({ modkey, "Shift" }, "#" .. i + 9,
	              function ()
	                  if client.focus then
	                      local tag = client.focus.screen.tags[i]
	                      if tag then
	                          client.focus:move_to_tag(tag)
	                      end
	                 end
	              end,
	              {description = "move focused client to tag", group = "tag"}),
	    -- Toggle tag on focused client.
	    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
	              function ()
	                  if client.focus then
	                      local tag = client.focus.screen.tags[i]
	                      if tag then
	                          client.focus:toggle_tag(tag)
	                      end
	                  end
	              end,
	              {description = "toggle focused client on tag", group = "tag"})
	)
end

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click" }
            awful.mouse.client.move(c)
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click" }
            awful.mouse.client.resize(c, "bottom_right")
        end)
    })
end)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Mouse bindings                                                                                                              
root.buttons(gears.table.join(                                                                                                     
    awful.button({        }, 3, function () menu:toggle() end),                                                                     
    awful.button({ modkey }, 4, awful.tag.viewprev),                                                                                      
    awful.button({ modkey }, 5, awful.tag.viewnext)                                                                                       
))                                                                                                                                 
-- }}} 
