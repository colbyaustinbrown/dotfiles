xrandr --output DP-2 --primary
xrandr --output DP-4 --left-of DP-2
xrandr --output HDMI-0 --right-of DP-2 --rotate left
xbindkeys
systemctl --user set-environment DISPLAY=:0
exec i3


