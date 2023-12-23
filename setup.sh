#! /bin/bash

# Terminal         - foot
# Window Manager   - hyprland
# Notifications    - dunst
# System bar       - waybar
# App launcher     - wofi
# Shell            - zsh
# Wallpaper Setter - hyprpaper
# File manager     - thunar
# Screen sharing   - xdg-desktop-portal-hyprland
# Automount USB    - udisks2
# Screen locker    - swaylock
# Screenshots      - grim / slurp / wl-clipboard
# Editor           - nvim (neovim)

# Package Manager  - paru
echo "Update..."
sudo pacman -Syu

echo "Selecting the fastest mirrors..."
./scripts/updateMirrors.sh

echo "Install paru (AUR)..."
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

echo "Install dependencies..."
sudo paru -S pacman-contrib neovim zsh swaylock thunar grim wl-clipboard slurp udisks2 foot wofi waybar hyprpaper hyprland dunst xdg-desktop-portal-hyprland
cp -rf configs/* ~/.config/
cp -rf homeConfigs/.* ~

# Enable scheduled tasks, like timeshift.
sudo systemctl start cronie
sudo systemctl start cronie.service
sudo systemctl enable cronie
sudo systemctl enable cronie.service

# GTK Theme, Cursor and Icons
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "GoogleDot-Black"

# Set ZSH as shell.
if [ $SHELL != "/usr/bin/zsh" ]; then
	chsh -s /usr/bin/zsh
fi
