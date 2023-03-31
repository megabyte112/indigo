#!/bin/bash

# ask for X11 keymap
while true; do
	echo ""
	echo "Enter your X11 keyboard layout (us, gb, etc), or type 'list' to see a list of layouts."
	echo -n "> "
	read keyboard

	# list keyboard layouts and allow user to scroll through them
	if [ "$keyboard" == "list" ]; then
		cat /etc/indigo-installer/preset/bspwm/xkbs | less
		clear
		continue
	fi

	# check if keyboard layout is valid by checking if it's in the list
	if grep -q "$keyboard" /etc/indigo-installer/preset/bspwm/xkbs; then
		break
	else
		echo ""
		echo "Invalid keyboard layout. Please try again."
		continue
	fi

done

# replace XKEYMAPHERE in bspwmrc
sed -i "s/XKEYMAPHERE/$keyboard/g" /etc/indigo-installer/preset/bspwm/config/home/$username/.config/bspwm/bspwmrc
