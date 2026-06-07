#!/bin/bash

set -e

echo "🚀 Starting Hyprland Rice Installation..."

# 1. Update system and install core official packages
echo "📦 Installing core packages from official repositories..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm btop cava niri clipse fastfetch helix hyprland blender firefox waybar rofi zed steam helium-browser-bin kitty git xdg-desktop-portal-hyprland nautilus ttf-font-awesome

# 2. Check for an AUR helper (Yay), and install it if it's missing
if ! command -v yay &> /dev/null; then
    echo "🔍 Yay not found. Installing yay (AUR Helper)..."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

# 3. Install common AUR packages used in Hyprland rices (Uncomment if you use them)
echo "📦 Installing AUR packages..."
yay -S --noconfirm hyprshot yazi hyprlock hyprpicker awww pywal-16-colors

# 4. Ensure the system target directory exists
mkdir -p ~/.config

# 5. Copy your configuration files into the system
echo "📂 Deploying your custom configurations..."
cp -r .config/* ~/.config/

echo "✅ Installation complete! Please log out and select Hyprland at your login screen."
