#!/bin/bash

# This script installs the necessary packages for the Hyprland desktop environment.

# Ensure the script is not run as root
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run this script as root."
  exit
fi

# Update package databases
paru -Syu

# Install packages from AUR
paru -S --needed hyprland hyprscroll-git quickshell-git pywal swww wlogout

echo "Installation complete!"
