
Debian
====================
This directory contains files used to package babycoind/babycoin-qt
for Debian-based Linux systems. If you compile babycoind/babycoin-qt yourself, there are some useful files here.

## babycoin: URI support ##


babycoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install babycoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your babycoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/babycoin128.png` to `/usr/share/pixmaps`

babycoin-qt.protocol (KDE)

