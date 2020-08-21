xrandr --output eDP-1 --primary
xbindkeys
systemctl --user set-environment DISPLAY=:0
exec i3

