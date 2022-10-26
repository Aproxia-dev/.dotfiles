#!/usr/bin/python
import os
from Xlib import display
data = display.Display().screen().root.query_pointer()._data
if data["root_x"] <= 1920:
    os.system("scrot -a 0,150,1920,1080 -e 'xclip -selection clipboard -t image/png < $f && mv $f ~/.screenshots/' '%Y-%m-%d-%H.%M.%S_SecMon.png'")
elif data["root_x"] <= 3840:
    os.system("scrot -a 1921,0,1920,1080 -e 'xclip -selection clipboard -t image/png < $f && mv $f ~/.screenshots/' '%Y-%m-%d-%H.%M.%S_PriMon.png'")
else:
    os.system("scrot -a 3840,300,1650,1050 -e 'xclip -selection clipboard -t image/png < $f && mv $f ~/.screenshots/' '%Y-%m-%d-%H.%M.%S_ThrMon.png'")
