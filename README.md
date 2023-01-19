# Welcome to Indigo!

An Arch-based Linux distro, designed to look good right out of the box.


Indigo includes:
- The [Catppuccin](https://github.com/catppuccin/catppuccin) Mocha theme, including cursors and icons
- A preconfigured and riced desktop environment or window manager, chosen by the user
- Fully functional package management via `pacman`
- AUR support with `yay` or other similar AUR helpers
- Incredibly modular installer, for the tinkerers out there
- Plus much more!

## Building

You must use Arch Linux (or an Arch-based distro, like Manjaro, EndeavourOS, or even Indigo itself!) to compile Indigo.

Install `archiso`
```
sudo pacman -S archiso
```

Clone this repository
```
git clone https://github.com/megabyte112/indigo.git && cd indigo
```

Use the `mkindiso` script to compile
```
./mkindiso
```

## Footnotes

Currently, this is only a test - Indigo is not yet in a usable state.
