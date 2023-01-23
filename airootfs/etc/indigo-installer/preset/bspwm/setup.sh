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

# reload font cache
arch-chroot /mnt bash -c "fc-cache -f -v"

# chmod the entire home config folder
arch-chroot /mnt bash -c "chmod -R +x /home/$username/.config/*"

# chmod the firstboot.sh file
arch-chroot /mnt bash -c "chmod +x /home/$username/firstboot.sh"

# check if this is running in a virtual machine, and if so, comment out the picom from bspwmrc
if [[ $(systemd-detect-virt) != "none" ]]; then
    sed -i "s/picom/#picom/" /mnt/home/$username/.config/bspwm/bspwmrc
    echo "[bspwm preset setup] Running in a virtual machine, so picom has been disabled"
fi

exit 0
