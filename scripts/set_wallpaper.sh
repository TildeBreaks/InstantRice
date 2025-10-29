#!/bin/bash

# This script sets a new wallpaper and updates the system theme using pywal.

# Check if an image file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/image.jpg"
  exit 1
fi

IMAGE_PATH=$(realpath "$1")

if [ ! -f "$IMAGE_PATH" ]; then
  echo "Error: File not found at $IMAGE_PATH"
  exit 1
fi

# Set the wallpaper using swww
swww img "$IMAGE_PATH" --transition-type any

# Generate and apply the color scheme with pywal
wal -i "$IMAGE_PATH" -n # -n skips setting the wallpaper, as swww already did it
