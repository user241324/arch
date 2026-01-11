#!/bin/bash

# Update installed packages
sudo pacman -Syu --noconfirm

# Install yay
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# Install chromebook-linux-audio
sudo pacman -S --noconfirm python
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio /$HOME/.chromebook-linux-audio
cd $HOME/.chromebook-linux-audio || exit
./setup-audio

# Install cros-keyboard-map
git clone https://github.com/WeirdTreeThing/cros-keyboard-map $HOME/.cros-keyboard-map
cd $HOME/.cros-keyboard-map || exit
./install.sh

# Install mkinitcpio-numlock
yay -S mkinitcpio-numlock --noconfirm
