#!/bin/bash
username=$1


# lightdm
# add user to autologin in lightdm.conf
sed -i "s/#autologin-user=/autologin-user=$username/" /mnt/etc/lightdm/lightdm.conf

# make autologin group
arch-chroot /mnt bash -c "groupadd autologin"

# add user to autologin group
arch-chroot /mnt bash -c "gpasswd -a $username autologin"
arch-chroot /mnt bash -c "usermod -a -G autologin $username"

# replace 'color_scheme_path=/home/username' with 'color_scheme_path=/home/'$username'' in qt5ct.conf
sed -i "s/color_scheme_path=\/home\/username/color_scheme_path=\/home\/$username/" /mnt/home/$username/.config/qt5ct/qt5ct.conf

# replace 'color_scheme_path=/home/username' with 'color_scheme_path=/home/'$username'' in qt6ct.conf
sed -i "s/color_scheme_path=\/home\/username/color_scheme_path=\/home\/$username/" /mnt/home/$username/.config/qt6ct/qt6ct.conf

# replace REPLACETHIS in flameshot.ini with /home/(username)/Screenshots
sed -i "s/REPLACETHIS/\/home\/$username\/Screenshots/" /mnt/home/$username/.config/flameshot/flameshot.ini

# check if a a battery is present, and if so, enable the battery widget in polybar
if [[ $(ls /sys/class/power_supply/ | grep -c "BAT") -gt 0 ]]; then
    sed -i "s/right3 alsa right2 network/right4 alsa right3 network right2 battery/" /mnt/home/$username/.config/polybar/shapes/config.ini

    # replace BATTERYHERE in polybar modules.ini with the battery name
    battery=$(arch-chroot /mnt bash -c "ls /sys/class/power_supply/ | grep -E "BAT"")
    sed -i "s/BATTERYHERE/$battery/" /mnt/home/$username/.config/polybar/shapes/modules.ini

    # same for power adapter
    power=$(arch-chroot /mnt bash -c "ls /sys/class/power_supply/ | grep -E "AC"")
    sed -i "s/POWERHERE/$power/" /mnt/home/$username/.config/polybar/shapes/modules.ini

    echo "[bspwm preset setup] Battery detected, so polybar battery widget has been enabled"
fi

# if a connection exists in /etc/NetworkManager/system-connections, assume wifi is used
if [[ $(ls /etc/NetworkManager/system-connections/ | grep -c ".*") -gt 0 ]]; then
    network=$(arch-chroot /mnt bash -c "ip link | grep -E "^[0-9]+: w" | cut -d: -f2 | tr -d ' '")
else
    network=$(arch-chroot /mnt bash -c "ip link | grep -E "^[0-9]+: e" | cut -d: -f2 | tr -d ' '")
fi


# add network interface name to polybar modules.ini
inlog $D "replacing polybar network interface name..."
sed -i "s/NETWORKADAPTERHERE/$network/g" /home/$username/.config/polybar/shapes/modules.ini

# reload font cache
arch-chroot /mnt bash -c "fc-cache -f -v"

# chmod the entire home config folder
arch-chroot /mnt bash -c "chmod -R 766 /home/$username/.config/*"

# chmod the firstboot.sh file
arch-chroot /mnt bash -c "chmod 777 /home/$username/firstboot.sh"

# check if this is running in a virtual machine, and if so, comment out the picom from bspwmrc
if [[ $(systemd-detect-virt) != "none" ]]; then
    sed -i "s/picom/#picom/" /mnt/home/$username/.config/bspwm/bspwmrc
    echo "[bspwm preset setup] Running in a virtual machine, so picom has been disabled"
fi

# make fish the default shell
arch-chroot /mnt bash -c "chsh -s /usr/bin/fish $username"

exit 0
