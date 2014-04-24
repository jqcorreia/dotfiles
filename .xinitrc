[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# [[ -f ~/.solarized ]] && xrdb -merge ~/.solarized

xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --output LVDS1 --mode 1366x768 --pos 1920x440

setxkbmap pt -option ctrl:swapcaps

xset r rate 250 35
xset +fp /usr/share/fonts/local
xset fp rehash

xcompmgr -c &

nitrogen --restore

exec $1
