#!/bin/bash

### DESCRIPTION ###
# Arch Linux package and configuration installation script.
# Only use with fresh minimal installations, otherwise the git clones may fail.

### TO DO ###
# Confirm hyprpolkit works as currently set
# Add if statement for SSH to allow users to say no and initiate reboot
# Try to adjust yay installation to not require intervention
# Add yayinstall variable for --needed --noconfirm options
# Figure out flatpak theming

### VARIABLES ###
pacinstall="sudo pacman -S --needed --noconfirm"

### UPDATE ###
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
$pacinstall hyprland hyprpaper hyprpolkitagent hyprshot otf-font-awesome waybar wofi

### GTK THEMING ###
$pacinstall breeze-gtk

### QT THEMING ###
$pacinstall breeze qt5-wayland qt6-wayland
yay -S qt5ct-kde qt6ct-kde --noconfirm

### APPLICATIONS ###
$pacinstall alacritty firefox libreoffice-fresh mousepad pavucontrol qbittorrent steam vlc
yay -S betterbird-bin libation visual-studio-code.bin --noconfirm

# VIRT-MANAGER
$pacinstall dmidecode dnsmasq libvirt qemu-full swtpm virt-manager
sudo systemctl enable libvirtd.socket
sudo usermod -aG libvirt,libvirt-qemu $USER

### THUNAR ###
$pacinstall gvfs gvfs-mtp gvfs-smb mousepad sshfs thunar thunar-archive-plugin thunar-volman xarchiver 7zip

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

### SSH ###
$pacinstall openssh
ssh-keygen -f $HOME/.ssh/id_ed25519
echo "Please enter <user>@<hostname> to share your public key with an SSH server:"
read sshServer
ssh-copy-id -i $HOME/.ssh/id_25519.pub $sshServer

### REBOOT ###
sudo reboot now
