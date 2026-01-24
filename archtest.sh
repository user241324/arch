#!/bin/bash

pacinstall="sudo pacman -S --needed --noconfirm"

# UPDATE
sudo pacman -Syu --noconfirm

### GITCONFIGS ###
$pacinstall git
git clone https://github.com/user241324/gitconfigs $HOME/gitconfigs
cp -r $HOME/gitconfigs/HOME/. $HOME/
sudo cp -r $HOME/gitconfigs/root/. /
sudo rm -r $HOME/gitconfigs

### YAY ###
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

### CLI TOOLS ###
$pacinstall bash-completion brightnessctl btop fastfetch gnu-free-fonts grim man-db nano slurp speedtest-cli tailscale
yay -S paccache-hook --noconfirm
echo "fastfetch" | tee -a $HOME/.bashrc

### HYPRLAND ###
$pacinstall hyprland hyprpaper hyprpolkitagent otf-font-awesome waybar wofi

### GTK THEMING ###
$pacinstall breeze-gtk

### QT THEMING ###
$pacinstall breeze

### APPLICATIONS ###
$pacinstall alacritty firefox hunspell-en_us libreoffice-fresh pavucontrol qbittorrent vlc

### THUNAR ###
$pacinstall gvfs gvfs-mtp gvfs-smb mousepad sshfs thunar thunar-archive-plugin thunar-volman xarchiver

### REBOOT ###
sudo reboot now
