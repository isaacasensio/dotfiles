#!/bin/bash
set -e

# Array of names to stow
names=("bat" "btop" "git" "mc" "zsh" "sketchybar" "oh-my-posh" "wallpapers" "yabai" "ghostty" "karabiner" "tmux" "nvim" "yazi" "sesh")

for name in "${names[@]}"; do
    echo "Running: stow --target $HOME $name"
    stow --target "$HOME" "$name"
    echo "Successfully stowed: $name"
done

echo "Rebuilding bat cache file"
bat cache --build
echo "Successfully rebuilt the bat cache"

echo "Install Tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm || true

echo "Install catppuccin Tmux theme"
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

echo "Install catppuccin plugin for musikcube"
git clone git@github.com:EdenQwQ/musikcube.git /tmp/musikcube_catpppuccin
cp -f /tmp/musikcube_catpppuccin/themes $HOME/.config/musikcube

echo "Installing the wallpaper"
m wallpaper $HOME/.config/wallpapers/nice-blue-background.png
echo "Successfully installed the wallpaper"

echo "Reloading sketchybar"
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
brew services restart felixkratz/formulae/sketchybar
sketchybar --reload
echo "Successfully reloaded sketchybar"


echo "All commands completed successfully."