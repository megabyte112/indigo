# betterlockscreen
betterlockscreen -u /usr/share/backgrounds/waves.png

# lock screen
betterlockscreen -l dim

# set background
feh --bg-scale /usr/share/backgrounds/waves.png

# set volume to 50%
amixer set Master 50%

# in bspwmrc, remove 'bash $HOME/firstboot.sh' and replace with 'betterlockscreen -l dim &
sed -i "s/bash \$HOME\/firstboot.sh/betterlockscreen -l dim/" $HOME/.config/bspwm/bspwmrc

# open keybind file
alacritty -e sh -c "cat $HOME/keybinds | less" &

# pause
sleep 1

# make it floating
bspc node -t floating

# resize it
bspc node -z top 0 -50
bspc node -z bottom 0 50
bspc node -z left -200 0
bspc node -z right 200 0

# self destruct
rm $HOME/firstboot.sh