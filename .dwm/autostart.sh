sxhkd &
xrandr --output HDMI-A-0 --mode 1920x1080 -r 144 --primary --output DisplayPort-2 --mode 1920x1080 -r 60 --left-of HDMI-A-0 &
mpd &
dunst &
picom -b --experimental-backends &
feh --bg-fill pix/owouwu.png &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
polybar primary &
polybar secondary &
