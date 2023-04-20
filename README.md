# Indigo

An Arch-based Linux distro, designed to look good right out of the box.


## Using

Download the ISO from [here](https://github.com/megabyte112/Indigo-ISO/releases) and flash to your favourite USB drive, using [rufus](https://rufus.ie/en/) (Windows only) or [Balena Etcher](https://www.balena.io/etcher).

Once you boot from the USB, you will be in a command line, just like Arch Linux's ISO. From here, you are recommended to use the Installer by typing `./install`. You will then be guided through the automatic installation process.


## Building

You must use Arch Linux (or an Arch-based distro, like Manjaro, EndeavourOS, or even Indigo itself!) to compile Indigo.

Install `archiso`
```
sudo pacman -S archiso
```

Clone this repository
```
git clone https://github.com/megabyte112/indigo.git
cd indigo
```

Use the `mkindiso` script to compile
```
./mkindiso
```

The ISO file, as well as its SHA-512 checksum, will appear in the `out` folder.

To verify the checksum,
```
cd out
sha512sum -c indigo-XXXX-XX-XX-XX-XX-XX-x86_64.iso.sha512sum
```
