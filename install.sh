#!/bin/bash


sudo pacman --noconfirm -Syu
sudo pacman -S --noconfirm git openssh

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg --noconfirm -si

PACKAGES=(
  # Terminal and Shell Enhancements
  alacritty
  bat
  starship
  tmux
  fzf
  tldr
  speedtest-cli
  ripgrep
  wget
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  z

  # System Utilities
  blueman
  bluez
  brightnessctl
  btop
  cliphist
  fastfetch
  grim
  jq
  less
  networkmanager
  pamixer
  polkit-gnome
  qpwgraph
  rsync
  swappy
  slurp
  swaybg
  sway
  swaync
  swayidle
  tlp
  xdg-user-dirs
  xdg-desktop-portal-wlr
  xdg-desktop-portal
  waybar
  xorg-xwayland

  # Media and Audio
  mpv
  playerctl
  pavucontrol

  # Appearance and Theming
  nwg-look
  qt5ct
  qt6ct

  # Applications
  eza
  imv
  stow

  # Neovim Dependancys BLOAT!!!
  neovim
  go
  nodejs
  npm
  lua51
  imagemagick
  stylua
  cmake
  unzip
  fd
  shellcheck
)

sudo pacman -S --noconfirm "${PACKAGES[@]}"

AUR_PACKAGES=(
  # Terminal and Shell Enhancements
  fzf-tab-git

  # System Utilities
  hyprpicker 
  swaylock-effects
  wdisplays
  sysz

  # Media and Audio
  cmus-git
  librewolf-bin

  # Appearance and Theming
  gruvbox-dark-gtk
  hack-nf-git
  ttf-font-awesome
  nwg-look
  papirus-icon-theme-git
  xcursor-simp1e-gruvbox-dark

  # Applications
  krabby-bin
  rofi-wayland
  tgpt
  yazi

  # Neovim Plugins
  ueberzugpp
)

yay -S --noconfirm "${AUR_PACKAGES[@]}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo systemctl enable sshd bluetooth polkit dbus tlp NetworkManager
sudo systemctl start sshd bluetooth polkit dbus tlp NetworkManager            

xdg-user-dirs-update

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm i -g bash-language-server neovim

sudo pacman -Rns --noconfirm $(pacman -Qtdq)

sudo chsh $USER -s /usr/bin/zsh

echo "Done! Please make sure the GTK theme has been applied in nwg-look"
echo "Also install tmux plugins by pressing prefix + I in tmux"

rm -rf install.sh LICENSE pkg PKGBUILD README.md src TODO *.gz yay-bin *.xzt *.zst .SRCINFO

stow .
