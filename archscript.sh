#!/bin/bash

### DESCRIPTION ###
# Arch Linux package and configuration installation script.
# Only use with fresh minimal installations, otherwise the git clones may fail.

### TO DO ###
# Add polkit gui (lxsession contains lxpolkit) for x11
# Confirm hyprpolkit works as currently set
# Add if statement for SSH to allow users to say no and initiate reboot
# Try to adjust yay installation to not require intervention
# Add yayinstall variable for --needed --noconfirm options
# Confirm via testing if additional theme files are needed for qt/gtk
# Figure out flatpak theming

### VARIABLES ###
pacinstall="sudo pacman -S --needed --noconfirm"

### UPDATE ###
sudo pacman -Syu

### GITCONFIGS ###
$pacinstall git
git clone https://github.com/user241324/gitconfigs $HOME/gitconfigs
cp -r $HOME/gitconfigs/HOME/. $HOME/
sudo cp -r $HOME/gitconfigs/root/. /
sudo rm -r $HOME/gitconfigs
chmod +x $HOME/.config/polybar/launch.sh

### YAY ###
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

### CLI TOOLS ###
$pacinstall bash-completion brightnessctl btop fastfetch gnu-free-fonts man-db nano speedtest-cli tailscale
yay -S paccache-hook --noconfirm
echo "fastfetch" | tee -a $HOME/.bashrc

### SDDM ###
$pacinstall qt5-declarative gnu-free-fonts sddm xorg-server xorg-xrandr
sudo systemctl enable sddm.service

### HYPRLAND ###
$pacinstall hyprland hyprpaper hyprpolkitagent otf-font-awesome waybar wofi

### I3 ###
$pacinstall feh i3-wm polybar rofi

### GTK THEMING ###
$pacinstall breeze-gtk nwg-look

### QT THEMING ###
$pacinstall breeze qt5-wayland qt6-wayland
yay -S qt5ct-kde qt6ct-kde --noconfirm
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment

### APPLICATIONS ###
$pacinstall alacritty firefox libreoffice-fresh mousepad pavucontrol qbittorrent steam vlc
yay -S betterbird-bin libation visual-studio-code.bin --noconfirm

# VIRT-MANAGER
$pacinstall dmidecode dns-masq libvirt qemu-full swtpm virt-manager
sudo systemctl enable libvirtd.socket

### THUNAR ###
$pacinstall gvfs gvfs-smb thunar thunar-archive-plugin thunar-volman xarchiver

### FLATPAK ###
$pacinstall flatpak

avidemux=org.avidemux.Avidemux
bitwarden=com.bitwarden.desktop
bottles=com.usebottles.bottles
dolphinemu=org.DolphinEmu.dolphin-emu
flatseal=com.github.tchx84.Flatseal
gopher64=io.github.gopher64.gopher64
heroicgames=com.heroicgameslauncher.hgl
kid3=org.kde.kid3
melonds=net.kuribo64.melonDS
mgba=io.mgba.mGBA
mpv=io.mpv.Mpv
pcsx2=net.pcsx2.PCSX2
protonvpn=com.protonvpn.www
protonupqt=net.davidotek.pupgui2
ungoogledchromium=io.github.ungoogled_software.ungoogled_chromium
vscode=com.visualstudio.code

flatpak install -y $flatseal $bitwarden $heroicgames

### SSH ###
$pacinstall openssh
ssh-keygen -f $HOME/.ssh/id_ed25519
echo "Please enter <user>@<hostname> to share your public key with an SSH server:"
read sshServer
ssh-copy-id -i $HOME/.ssh/id_25519.pub $sshServer

### REBOOT ###
sudo reboot now
