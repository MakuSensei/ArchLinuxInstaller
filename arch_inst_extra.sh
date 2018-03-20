#!/bin/bash

function get_escaped() {
	echo `echo "$1" | sed 's/\//\\\//g'`
}

function setup_transmission() {
}

function setup_nemo() {
	gsettings set org.nemo.desktop show-desktop-icons false
	gsettings set org.cinnamon.desktop.default-applications.terminal exec terminator
}


function setup_packages() {
	packages=""
	packages+=" "
	#packages+=" nemo nemo-fileroller nemo-share nemo-preview"
	#packages+=" git mercurial svn cvs bzr premake cmake scons"
	#packages+=" emacs emacs-php-mode emacs-lua-mode emacs-haskell-mode"
	#packages+=" ht radare2 binutils"

	packages+=" erlang ocaml ghc lua sbt scala apache-ant sbcl bigloo boost clang"
	packages+=" "
	



	pacman -S --needed --noconfirm $packages
}

function install_all() {
	setup_packages
	setup_lightdm
	setup_mousepad
	setup_theme
	setup_x11vnc
	setup_tigervnc
	setup_scite
	setup_xserver
	setup_i3wm
	setup_i3blocks
	setup_terminator
	setup_thunar
	setup_vlc
	setup_gtk
	setup_shortcuts
	setup_viewnior
	setup_cups
	#setup_tmpcache
}

trap 'echo "Error on line $LINENO"' ERR
set -e

if [ $SUDO_USER ]; then
	HOME=/home/$SUDO_USER
	USER=$SUDO_USER
fi

if [ $1 ]; then
	eval $1
	echo "'$1' run successfully!"
else
	install_all
	echo "install completed successfully!"
fi
