#!/bin/bash
# This script sets up the Hyprland configuration by creating symbolic links.

# Set the source directory
SOURCE_DIR="$(pwd)/hypr"

# Set the destination directory
DEST_DIR="$HOME/.config"

# Create the destination directories if they don't exist
mkdir -p "$DEST_DIR/hypr"
mkdir -p "$DEST_DIR/kitty"
mkdir -p "$DEST_DIR/dunst"
mkdir -p "$DEST_DIR/hypr/quickshell"

# Create the symbolic links for all configs
ln -sf "$SOURCE_DIR/hyprland.conf" "$DEST_DIR/hypr/hyprland.conf"
ln -sf "$SOURCE_DIR/kitty/kitty.conf" "$DEST_DIR/kitty/kitty.conf"
ln -sf "$SOURCE_DIR/dunst/dunstrc" "$DEST_DIR/dunst/dunstrc"
ln -sf "$SOURCE_DIR/scripts" "$DEST_DIR/hypr/scripts"
ln -sf "$SOURCE_DIR/wallpapers" "$DEST_DIR/hypr/wallpapers"
ln -sf "$SOURCE_DIR/quickshell" "$DEST_DIR/hypr/quickshell"


echo "Hyprland configuration setup complete!"
echo "Please restart Hyprland to apply the changes."

exit 0
