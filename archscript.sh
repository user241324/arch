#!/bin/bash
# Add more flatpaks to be installed
# Add polkit gui (lxsession contains lxpolkit) for x11 
# Figure out flatpak theming

pacinstall="sudo pacman -S --needed --noconfirm"

# GITCONFIGS
$pacinstall git
sudo git clone https://github.com/user241324/backgrounds /usr/share/backgrounds
sudo rm -r /usr/share/backgrounds/.git
sudo rm /usr/share/backgrounds/README.md
git clone https://github.com/user241324/gitconfigs $HOME/.config
sudo rm -r $HOME/.config/.git
sudo rm $HOME/.config/README.md
chmod +x $HOME/.config/polybar/launch.sh
sudo mkdir /etc/sddm.conf.d
sudo mv $HOME/.config/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
sudo rm -r $HOME/.config/sddm
sudo mv $HOME/.config/.xsessionrc $HOME/.xsessionrc

# SSH
$pacinstall openssh
ssh-keygen -f $HOME/.ssh/id_ed25519
echo "Please enter <user>@<hostname> to share your public key with an SSH server:"
read sshServer
ssh-copy-id -i $HOME/.ssh/id_25519.pub $sshServer

# YAY
$pacinstall git base-devel
git clone https://aur.archlinux.org/yay.git $HOME/.yay
cd .yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# CLI TOOLS
$pacinstall bash-completion brightnessctl btop fastfetch git gnu-free-fonts man-db nano openssh speedtest-cli tailscale
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

$pacinstall alacritty firefox libreoffice-fresh mousepad pavucontrol qbittorrent steam vlc
yay -S betterbird-bin libation visual-studio-code.bin --noconfirm

# virt-manager
$pacinstall dmidecode dns-masq libvirt qemu-full swtpm virt-manager
sudo systemctl enable libvirtd.socket

# thunar
$pacinstall gvfs thunar thunar-archive-plugin thunar-volman xarchiver

###############
### FLATPAK ###
###############

$pacinstall flatpak

avidemux=org.avidemux.Avidemux
bitwarden=com.bitwarden.desktop
bottles=com.usebottles.bottles
dolphinemu=org.DolphinEmu.dolphin-emu
flatseal=com.github.tchx84.Flatseal
gopher64=io.github.gopher64.gopher64
kid3=org.kde.kid3
melonds=net.kuribo64.melonDS
mgba=io.mgba.mGBA
mpv=io.mpv.Mpv
pcsx2=net.pcsx2.PCSX2
protonvpn=com.protonvpn.www
protonupqt=net.davidotek.pupgui2
ungoogledchromium=io.github.ungoogled_software.ungoogled_chromium
vscode=com.visualstudio.code

flatpak install -y $avidemux $bottles

##############
### REBOOT ###
##############

sudo reboot now
