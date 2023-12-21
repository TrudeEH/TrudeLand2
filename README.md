# TrudeEH's Dotfiles
## Screenshots
![Screenshot](./screenshots/1.png)
![Screenshot](./screenshots/2.png)
![Screenshot](./screenshots/3.png)
![Screenshot](./screenshots/4.png)

## Setup
```sh
cd ~
git clone https://github.com/TrudeEH/dotfiles.git
cd dotfiles
./setup.sh
```
If you would like to change the configs later, I recommend forking the project.
## Update
```sh
cd ~/dotfiles
git fetch --all
git reset --hard origin/master
./update_configs.sh
```
If an update changes a dependency, run `setup.sh` again.
## Components
- **Terminal**: foot
- **Window Manager**: hyprland
- **Notifications**: dunst
- **System bar**: waybar
- **App launcher**: wofi
- **Shell**: zsh
- **Wallpaper Setter**: hyprpaper
- **File manager**: thunar
- **Screen locker**: swaylock
- **Editor:** nvim (neovim)
- **Package Manager**: paru
