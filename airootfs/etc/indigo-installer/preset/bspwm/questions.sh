username=$1

# ask for X11 keymap
while true; do
	echo ""
	echo "Enter your X11 keyboard layout (us, gb, etc), or type 'list' to see a list of layouts."
	echo -n "> "
	read keyboard

	# list keyboard layouts and allow user to scroll through them
	if [ "$keyboard" == "list" ]; then
		localectl list-x11-keymap-layouts
		clear
		continue
	fi

	# test loadkeys
	if loadkeys $keyboard 2> /dev/null; then
		break
	else
		inlog $D "invalid x11 keyboard layout"
		echo "Error: X11 keyboard layout $keyboard does not exist."
        if [ "$keyboard" == "uk" ]; then
            echo "Did you mean 'gb'?"
        fi
	fi
done

# replace XKEYMAPHERE in bspwmrc
sed -i "s/XKEYMAPHERE/$keyboard/g" /etc/indigo-installer/preset/bspwm/config/home/$username/.config/bspwm/bspwmrc

