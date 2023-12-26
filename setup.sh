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

echo -e "\e[32m[---------------SETUP OPTIONS---------------]\e[0m"
echo
read -p "[?] Select the fastest pacman mirrors? (y/n): " mirrorYN
read -p "[?] Install Firefox? (y/n): " firefoxYN
read -p "[?] Use ZSH prompt? (y/n): " zshYN
echo
echo

# -----------------------------------------------------------

echo -e "\e[32m[+] Updating...\e[0m"
sudo pacman -Syu

if [[ $mirrorYN != "n" ]]; then
	echo -e "\e[32m[+] Running updateMirrors.sh...\e[0m"
	./scripts/updateMirrors.sh
fi

# Check if paru is installed
paru=$(pacman -Q paru)

# Install paru (AUR)...
echo -e "\e[32m[+] Installing paru (AUR)...\e[0m"
if [[ -n "$paru" ]]; then
	echo -e "\e[32m[I] Paru is already installed.\e[0m"
else
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -rf paru
fi

echo -e "\e[32m[+] Installing dependencies...\e[0m"
sudo paru -S cronie pacman-contrib neovim swaylock thunar grim wl-clipboard slurp udisks2 foot wofi waybar hyprpaper hyprland dunst xdg-desktop-portal-hyprland

if [[ "$firefoxYN" != "n" ]]; then
	sudo paru -S firefox
fi

echo -e "\e[32m[+] Copying configurations...\e[0m"
cp -rf configs/* ~/.config/
cp -rf homeConfigs/.* ~

# Enable scheduled tasks, like timeshift.
echo -e "\e[32m[+] Enabling scheduled tasks...\e[0m"
sudo systemctl start cronie
sudo systemctl start cronie.service
sudo systemctl enable cronie
sudo systemctl enable cronie.service

# ZSH setup
if [[ "$zshYN" != "n" ]]; then
	sudo paru -S zsh

	# Install p10k
	echo -e "\e[32m[+] Installing p10k...\e[0m"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

	# Set ZSH as shell.
	if [ $SHELL != "/usr/bin/zsh" ]; then
		chsh -s /usr/bin/zsh
	fi
fi

# GTK Theme, Cursor and Icons
echo -e "\e[32m[+] Setting GTK Theme, Cursor and Icons...\e[0m"
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "GoogleDot-Black"
