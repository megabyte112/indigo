# Indigo

An Arch-based Linux distro, designed to look good right out of the box.

## Development Repository

This repository is private and should not be shared with anyone other than its contributors.


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