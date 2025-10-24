#!/bin/bash
# This script handles the dynamic theming.

# Set the wallpaper directory
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Exit if the wallpaper directory doesn't exist
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory not found at $WALLPAPER_DIR"
    exit 1
fi

# Get a list of wallpapers
WALLPAPERS=("$WALLPAPER_DIR"/*)

# Exit if no wallpapers are found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "Error: No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Select a random wallpaper
RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

# Set the wallpaper using swww
swww img "$RANDOM_WALLPAPER" --transition-type any

# Generate and apply the color scheme with pywal
wal -i "$RANDOM_WALLPAPER"

# Reload Waybar and Dunst to apply the new theme
killall -SIGUSR2 waybar
pkill dunst && dunst &

exit 0
