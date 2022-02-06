setxkbmap cz -variant qwerty
xrandr --output HDMI-A-0 --mode 1920x1080 -r 144 --primary --output DisplayPort-2 --mode 1920x1080 -r 60 --left-of HDMI-A-0 &
exec dwm
