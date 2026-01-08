#!/bin/bash

#Update installed packages
sudo pacman -Syu --noconfirm

#Install yay and its dependencies
sudo pacman -S --needed --noconfirm git base-devel
cd ~ || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

#Install chromebook-linux-audio
sudo pacman -S --noconfirm python
cd ~ || exit
git clone https://github.com/WeirdTreeThing/chromebook-linux-audio
cd chromebook-linux-audio || exit
./setup-audio

#Install cros-keyboard-map (chromebook keymapping)
cd ~ || exit
git clone https://github.com/WeirdTreeThing/cros-keyboard-map
cd cros-keyboard-map || exit
./install.sh

#Install mkinitcpio-numlock (enables numlock at startup)
cd ~ || exit
yay -S mkinitcpio-numlock --noconfirm

#Install openssh and enable sshd.service
sudo pacman -S --noconfirm openssh

#Install Hyprland window manager and needed applications
sudo pacman -S --noconfirm alacritty alsa-utils brightnessctl grim hyprland hyprpaper pavucontrol pulseaudio pulseaudio-alsa sof-firmware otf-font-awesome waybar wofi
yay -S pulseaudio-ctl

#Install file management tools with thunar
sudo pacman -S --noconfirm adw-gtk-theme file-roller gvfs gvfs-smb ntfs-3g nwg-look thunar thunar-archive-plugin thunar-volman sshfs

#Install other packages
sudo pacman -S --noconfirm baobab chromium dnsmasq docker docker-compose fastfetch firefox keyd libreoffice-fresh qbittorrent tailscale wev
yay -S corefm libcprime libcsys pulseaudio-nextsink python-setuptools-reproducible visual-studio-code-bin betterbird --noconfirm
