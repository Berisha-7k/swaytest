#!/bin/bash
set -eEuo pipefail

echo -e "${NORD_YELLOW}>>> Updating system packages...${RESET}"
sudo pacman -Syu --noconfirm

echo -e "${NORD_YELLOW}>>> Updating AUR packages...${RESET}"
yay -Syu --noconfirm

# --- Dev Tools ---
DEV_TOOLS=(
    base-devel
    git
    go
    python-build
    python-pip
    python-setuptools
)
echo -e "${NORD_YELLOW}>>> Installing Dev Tools...${RESET}"
sudo pacman -S --needed --noconfirm "${DEV_TOOLS[@]}"

# --- Needed Dependencies (Pacman) ---
DEPENDENCIES=(
    sway
    swaybg
    swayidle
    xorg-server
    xorg-xinit
    xorg-xrandr
    xorg-xinput
    wl-clipboard
    waybar
    slurp
    grim
    nvidia
    nvidia-utils
    nvidia-settings
)
echo -e "${NORD_YELLOW}>>> Installing Dependencies...${RESET}"
sudo pacman -S --needed --noconfirm "${DEPENDENCIES[@]}"

# --- Regular Packages (Pacman) ---
PACKAGES=(
    firefox
    gimp
    inkscape
    kitty
    alacritty
    thunar
    gthumb
    fastfetch
    fuzzel
    neovim
    starship
    zsh
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-logs
    gnome-maps
    gnome-software
    gnome-tweaks
    fzf
    zoxide
)
echo -e "${NORD_YELLOW}>>> Installing Packages...${RESET}"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# --- AUR Packages (yay) ---
AUR_PACKAGES=(
    spotify
    spicetify-cli
    swaylock-effects-git
    swayosd-git
    sway-contrib
)
echo -e "${NORD_YELLOW}>>> Installing AUR Packages...${RESET}"
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo -e "${NORD_YELLOW}>>> All done!   ${RESET}"

