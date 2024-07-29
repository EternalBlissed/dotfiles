# Eternal's Dotfiles

## Structure

```sh
├── .config # Main config entry point.
│   ├── alacritty
│   ├── bat
│   ├── btop
│   ├── cmus
│   ├── nvim
│   ├── nwg-look
│   ├── qt5ct
│   ├── qt6ct
│   ├── rofi
│   ├── starship.toml
│   ├── swappy
│   ├── sway
│   ├── swaylock
│   ├── swaync
│   ├── waybar
│   └── yazi
├── .gtkrc-2.0 # Gtk Themes
├── install.sh # Deployment Script
├── LICENSE # The license
├── README.md
├── Scripts # My personal bash/sh scripts.
│   ├── shell-color-scripts
├── .tmux.conf # Tmux configuraiton
├── TODO # To-Do List
└── .zshrc # Shell Configuration
```

## Quickstart

I use GNU Stow to manage my dotfiles.

**Installation:**
   - Run `./install.sh` to install all dependencies and deploy the dotfiles using Stow.

## License

This project is licensed under the [Unlicense](https://unlicense.org)
