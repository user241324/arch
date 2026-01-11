#!/bin/bash

pacinstall="sudo pacman -S --needed --noconfirm"

# GITCONFIGS
$pacinstall git

git clone https://github.com/user241324/gitconfigs/HOME/.config $HOME/.config
chmod +x $HOME/.config/polybar/launch.sh
git clone https://github.com/user241324/gitconfigs/HOME/scripts $HOME/scripts
git clone https://github.com/user241324/gitconfigs/HOME/.xsessionrc $HOME/.xsessionrc

sudo git clone https://github.com/user241324/gitconfigs/etc/X11 /etc/X11
sudo git clone https://github.com/user241324/gitconfigs/etc/sddm.conf.d /etc/sddm.conf.d

sudo git clone https://github.com/user241324/gitconfigs/usr/share/backgrounds /usr/share/backgrounds
sudo git clone https://github.com/user241324/gitconfigs/usr/share/rofi /usr/share/rofi

# YAY
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# CLI TOOLS
$pacinstall bash-completion brightnessctl fastfetch git gnu-free-fonts man-db nano openssh speedtest-cli tailscale
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
