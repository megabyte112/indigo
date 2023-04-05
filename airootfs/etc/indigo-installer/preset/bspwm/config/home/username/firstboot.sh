# betterlockscreen
betterlockscreen -u /usr/share/backgrounds/waves.png

# set background
feh --bg-scale /usr/share/backgrounds/waves.png

# in bspwmrc, remove 'bash $HOME/firstboot.sh' and replace with 'betterlockscreen -l dim
sed -i "s/bash \$HOME\/firstboot.sh/betterlockscreen -l dim/" $HOME/.config/bspwm/bspwmrc

# open keybind file
alacritty -e sh -c "cat $HOME/keybinds | less"

# lock screen
betterlockscreen -l dim

# self destruct
rm $HOME/firstboot.sh