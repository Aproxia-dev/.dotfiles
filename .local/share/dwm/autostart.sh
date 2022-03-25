killall mpd
# dwmblocks &
sxhkd &
xrandr --output HDMI-A-0 --mode 1920x1080 -r 144 --pos 1920x0 --primary --output DisplayPort-2 --mode 1920x1080 -r 60 --pos 0x150 &
mpd &
dunst &
picom -b --experimental-backends &
feh --bg-fill --no-xinerama pix/wallhaven-oxo8gl_3840x1080.png &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
