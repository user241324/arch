#!/bin/bash

pacinstall="sudo pacman -S --needed --noconfirm"

# UPDATE
sudo pacman -Syu

# YAY
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# GITCONFIGS
$pacinstall git
git clone https://github.com/user241324/gitconfigs $HOME/gitconfigs
cp -r $HOME/gitconfigs/HOME/. $HOME/
sudo cp -r $HOME/gitconfigs/root/. /
sudo rm -r $HOME/gitconfigs
chmod +x $HOME/.config/polybar/launch.sh
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment

# CLI TOOLS
$pacinstall bash-completion fastfetch git man-db nano
yay -S paccache-hook --noconfirm
echo "fastfetch" | tee -a $HOME/.bashrc

# SDDM
$pacinstall qt5-declarative gnu-free-fonts sddm xorg-server xorg-xrandr
sudo systemctl enable sddm.service

# HYPRLAND
$pacinstall hyprland hyprpaper hyprpolkitagent otf-font-awesome waybar wofi

# I3
$pacinstall feh i3-wm polybar rofi # Add polkit agent for x11

# nwg-look
$pacinstall breeze-gtk nwg-look

# Qt theming
$pacinstall breeze qt5-wayland qt6-wayland
yay -S qt5ct-kde qt6ct-kde --noconfirm

########################
### GUI APPLICATIONS ###
########################

$pacinstall alacritty firefox mousepad pavucontrol qbittorrent thunar vlc xarchiver

# thunar tools
$pacinstall gvfs thunar thunar-archive-plugin thunar-volman xarchiver

# Reboot
sudo reboot now
