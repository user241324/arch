#!/bin/bash

###################
### DESCRIPTION ###
###################

# Use this script after installing Arch Linux with archinstall

#############
### NOTES ###
#############

# Testing needed.
# Add more flatpaks to be installed
# Upload $HOME/.config/Thunar/uca.xml from archbook and git clone before install

#################
### VARIABLES ###
#################

pacinstall="sudo pacman -S --needed --noconfirm"

###########
### SSH ###
###########

$pacinstall openssh
ssh-keygen -f $HOME/.ssh/id_ed25519
echo "Please enter <user>@<hostname> to share your public key with an SSH server:"
read sshServer
ssh-copy-id -i $HOME/.ssh/id_25519.pub $sshServer

###########
### YAY ###
###########

# Install yay and its dependencies
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

#################
### CLI TOOLS ###
#################

$pacinstall bash-completion brightnessctl btop fastfetch git man-db nano openssh speedtest-cli tailscale
yay -S paccache-hook --noconfirm

# Run at shell startup. Add additional programs by appending \n<command> before the endquote.
echo -e "\n# Run at shell startup\nfastfetch" >> .bashrc

########################
### GUI APPLICATIONS ###
########################

$pacinstall alacritty firefox libreoffice-fresh mousepad pavucontrol qbittorrent steam vlc
yay -S betterbird-bin libation visual-studio-code.bin --noconfirm

# virt-manager
$pacinstall dmidecode dns-masq libvirt qemu-full swtpm virt-manager
sudo systemctl enable libvirtd.socket

# thunar
$pacinstall gvfs thunar thunar-archive-plugin thunar-volman xarchiver

# nwg-look
$pacinstall adw-gtk-theme nwg-look

###############
### FLATPAK ###
###############

$pacinstall flatpak
flatpak install -y com.github.tchx84.Flatseal com.heroicgameslauncher.hgl

######################
### NVIDIA DRIVERS ###
######################

#$pacinstall nvidia-open nvidia-utils lib32-nvidia-utils nvidia-settings
# https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting 1.2.1 Early loading

###################
### BACKGROUNDS ###
###################

git clone https://github.com/user241324/backgrounds/guts_moonlight.jpg /usr/share/backgrounds/guts_moonlight.jpg

###############
### LIGHTDM ###
###############

git clone https://github.com/user241324/configs/lightdm /etc/lightdm
$pacinstall lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xorg-server
sudo systemctl enable lightdm.service

###############
### HYPRLAND ###
###############

git clone https://github.com/user241324/configs/hypr $HOME/.config/hypr
git clone https://github.com/user241324/configs/waybar $HOME/.config/waybar
$pacinstall hyprland hyprpaper otf-font-awesome waybar wofi

##########
### i3 ###
##########

git clone https://github.com/user241324/configs/i3 $HOME/.config/i3
git clone https://github.com/user241324/configs/polybar $HOME/.config/polybar
chmod +x /home/tom/.config/polybar/launch.sh
$pacinstall feh i3-wm polybar rofi xorg

##############
### REBOOT ###
##############

sudo reboot now
