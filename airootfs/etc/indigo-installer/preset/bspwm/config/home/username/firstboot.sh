# betterlockscreen
betterlockscreen -u /usr/share/backgrounds/waves.png

# set background
feh --bg-scale /usr/share/backgrounds/waves.png

# uncoment '$HOME/.fehbg &'' in bspwmrc
sed -i "s/#\$HOME\/.fehbg &/\$HOME\/.fehbg &/" $HOME/.config/bspwm/bspwmrc

# in bspwmrc, remove 'bash $HOME/firstboot.sh' and replace with 'betterlockscreen -l dim
sed -i "s/bash \$HOME\/firstboot.sh/betterlockscreen -l dim/" $HOME/.config/bspwm/bspwmrc

# lock screen
betterlockscreen -l dim

# self destruct
rm $HOME/firstboot.sh