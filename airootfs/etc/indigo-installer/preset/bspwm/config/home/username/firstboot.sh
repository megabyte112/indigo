# betterlockscreen
betterlockscreen -u /usr/share/backgrounds/waves.png

# set background
feh --bg-scale /usr/share/backgrounds/waves.png

# in bspwmrc, remove 'bash $HOME/firstboot.sh'
sed -i "s/bash \$HOME\/firstboot.sh &//" $HOME/.config/bspwm/bspwmrc

# self destruct
rm $HOME/firstboot.sh