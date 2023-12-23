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
# Before runing the setup script, change your monitor settings at ~/dotfiles/configs/hypr/hyprland.conf
# See https://wiki.hyprland.org/Configuring/Monitors/ for more info.
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
## Common issues
**After updating any file under `dotfiles`, run `./update_configs.sh` to apply the changes.**
- **Misconfigured monitors**
  - Edit: `~/dotfiles/configs/hypr/hyprland.conf`
  - Info: [Hyprland Wiki - Monitors](https://wiki.hyprland.org/Configuring/Monitors/)
- **The system bar reports the wrong CPU temp**
  - Edit: `~/dotfiles/configs/waybar/config`
  - Info: The CPU temp is read from `/sys/class/hwmon/hwmonX/temp1_input`. Change the 'X' value to match your CPU's sensor.

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
