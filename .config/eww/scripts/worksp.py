#!/usr/bin/python
from subprocess import run
from sys import argv as args

def workspaces():
    global wsboxes
    workspaces = [ "1", "2", "3", "4", "5" ]
    monitors   = [ "HDMI-A-0", "DisplayPort-2" ]

    wsboxes = ""

    monitor = args[1]
    for workspace in workspaces:
        _class = checkws(monitor, workspace)
        wsboxes += "(button :class '"+_class+"' :onclick 'bspc desktop -f "+workspace+".local' '"+workspace+"')"

def checkws(m, ws):
    f_cmd = "bspc query -D -d focused -m {} --names".format(m)
    f_out = run(f_cmd, capture_output=True, text=True, shell=True).stdout.replace('\n','')
    
    o_cmd = "bspc query -D -d .occupied -m {} --names".format(m)
    o_out = run(o_cmd, capture_output=True, text=True, shell=True).stdout.replace('\n','')
    
    if ws in f_out: 
        return "focused"
    elif ws in o_out:
        return "occupied"
    else:
        return ""

workspaces()
print("(box :class 'workspaces' :orientation 'v' :halign 'center' :valign 'start' :space-evenly 'false' :spacing '-5'" + wsboxes + " )")
