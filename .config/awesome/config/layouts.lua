local awful = require("awful")
local bling = require("modules.bling")

 awful.layout.layouts = {                                                                                                           
     awful.layout.suit.tile,                                                                                                        
     awful.layout.suit.tile.bottom,                                                                                                 
     bling.layout.centered,
     -- awful.layout.suit.fair,                                                                                                        
     -- awful.layout.suit.fair.horizontal,                                                                                             
     awful.layout.suit.floating,                                                                                                    
     awful.layout.suit.max,                                                                                                         
     -- awful.layout.suit.tile.left,                                                                                                
     -- awful.layout.suit.tile.top,                                                                                                 
     -- awful.layout.suit.spiral,                                                                                                   
     -- awful.layout.suit.spiral.dwindle,                                                                                           
     -- awful.layout.suit.max.fullscreen,                                                                                           
     -- awful.layout.suit.magnifier,                                                                                                
     -- awful.layout.suit.corner.nw,                                                                                                
     -- awful.layout.suit.corner.ne,                                                                                                
     -- awful.layout.suit.corner.sw,                                                                                                
     -- awful.layout.suit.corner.se,                                                                                                
 }                        
