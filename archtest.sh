#!/bin/bash

pacinstall="sudo pacman -S --needed --noconfirm"

# YAY
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb --noconfirm
yay -Syu --devel --noconfirm
yay -Y --devel --save

# GITCONFIGS
$pacinstall git
sudo git clone https://github.com/user241324/backgrounds /usr/share/backgrounds
sudo rm -r /usr/share/backgrounds/.git
sudo rm /usr/share/backgrounds/README.md
git clone https://github.com/user241324/gitconfigs $HOME/.config
sudo rm -r $HOME/.config/.git
sudo rm $HOME/.config/README.md
chmod +x $HOME/.config/polybar/launch.sh
sudo mv $HOME/.config/sddm/scripts/Xsetup /usr/share/sddm/scripts/Xsetup
sudo mv $HOME/.config/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
sudo rm -r $HOME/.config/sddm

# CLI TOOLS
$pacinstall bash-completion brightnessctl fastfetch git gnu-free-fonts man-db nano openssh
yay -S paccache-hook --noconfirm
echo -e "\n# Run at shell startup\nfastfetch" >> $HOME/.bashrc

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
