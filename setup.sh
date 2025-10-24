#!/bin/bash
# This script sets up the Hyprland configuration by creating symbolic links.

# Set the source directory
SOURCE_DIR="$(pwd)/hypr"

# Set the destination directory
DEST_DIR="$HOME/.config"

# Create the destination directories if they don't exist
mkdir -p "$DEST_DIR/hypr"
mkdir -p "$DEST_DIR/kitty"
mkdir -p "$DEST_DIR/waybar"
mkdir -p "$DEST_DIR/dunst"

# Create the symbolic links for all configs except waybar style.css
ln -sf "$SOURCE_DIR/hyprland.conf" "$DEST_DIR/hypr/hyprland.conf"
ln -sf "$SOURCE_DIR/kitty/kitty.conf" "$DEST_DIR/kitty/kitty.conf"
ln -sf "$SOURCE_DIR/waybar/config" "$DEST_DIR/waybar/config"
ln -sf "$SOURCE_DIR/dunst/dunstrc" "$DEST_DIR/dunst/dunstrc"
ln -sf "$SOURCE_DIR/scripts" "$DEST_DIR/hypr/scripts"
ln -sf "$SOURCE_DIR/wallpapers" "$DEST_DIR/hypr/wallpapers"

# Copy the waybar style.css and replace the placeholder with the user's home directory
cp "$SOURCE_DIR/waybar/style.css" "$DEST_DIR/waybar/style.css"
sed -i "s|__HOME__|$HOME|g" "$DEST_DIR/waybar/style.css"

echo "Hyprland configuration setup complete!"
echo "Please restart Hyprland to apply the changes."

exit 0
