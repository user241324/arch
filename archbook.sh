#!/bin/bash

# Script to install Arch on Chromebooks

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

# Install openssh
sudo pacman -S --noconfirm openssh

# Install hyprland
sudo pacman -S --noconfirm hyprland hyprpaper otf-font-awesome waybar wofi

sudo pacman -S alacritty brightnessctl fastfetch grim sof-firmware

sudo pacman -S adw-gtk-theme nwg-look


# File management with thunar
sudo pacman -S --noconfirm file-roller gvfs thunar thunar-archive-plugin thunar-volman

#Install other packages
sudo pacman -S --noconfirm baobab chromium dnsmasq docker docker-compose fastfetch firefox keyd libreoffice-fresh qbittorrent tailscale wev
yay -S corefm libcprime libcsys pulseaudio-nextsink python-setuptools-reproducible visual-studio-code-bin betterbird --noconfirm
