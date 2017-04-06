#!/bin/bash

set -e

if [ -z "$1" ]; then
	echo "No package name specified."
	exit
fi

mkdir -p $1
cd $1

wget -q "https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz"

tar xzf $1.tar.gz

cd $1

if [ -n "$2" ]; then
	sed -i "s/\(arch=\).*/\1('$2')/g" PKGBUILD
fi

makepkg -s

read -n 1 -s -p "Press any key to continue..."
echo -e "\n"

sudo pacman -U --noconfirm --needed $1*pkg.tar.xz
