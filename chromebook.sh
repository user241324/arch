#!/bin/bash

pacinstall="sudo pacman -S --needed --noconfirm"

# Update installed packages
sudo pacman -Syu --noconfirm

# Install yay
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# Install chromebook-linux-audio
$pacinstall python
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio /$HOME/.chromebook-linux-audio
cd $HOME/.chromebook-linux-audio || exit
./setup-audio

# Install cros-keyboard-map
git clone https://github.com/WeirdTreeThing/cros-keyboard-map $HOME/.cros-keyboard-map
cd $HOME/.cros-keyboard-map || exit
./install.sh

# Install mkinitcpio-numlock
yay -S mkinitcpio-numlock --noconfirm

# Additional audio packages
#pacinstall sof-firmware

# Reboot
sudo reboot now
