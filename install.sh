#!/bin/bash
# This script automates the installation of the "High Fantasy meets Cyberpunk" Hyprland theme.

# -----------------------------------------------------------------------------
# Color Definitions
# -----------------------------------------------------------------------------
readonly COLOR_BLUE="\033[0;34m"
readonly COLOR_GREEN="\033[0;32m"
readonly COLOR_RED="\033[0;31m"
readonly COLOR_YELLOW="\033[0;33m"
readonly COLOR_RESET="\033[0m"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------
info() {
    printf "${COLOR_BLUE}%s${COLOR_RESET}\n" "$1"
}

success() {
    printf "${COLOR_GREEN}%s${COLOR_RESET}\n" "$1"
}

warning() {
    printf "${COLOR_YELLOW}%s${COLOR_RESET}\n" "$1"
}

error() {
    printf "${COLOR_RED}%s${COLOR_RESET}\n" "$1" >&2
}

# -----------------------------------------------------------------------------
# Main Installation Logic
# -----------------------------------------------------------------------------
readonly REPO_URL="https://github.com/TildeBreaks/InstantRice.git"
readonly REPO_BRANCH="feat-hyprland-theming"
readonly DOTFILES_DIR="$HOME/.config/InstantRice-dotfiles"

# Update system packages
info "Updating system packages..."
sudo pacman -Syu --noconfirm || { error "Failed to update system packages."; exit 1; }

# Install official repository packages
info "Installing dependencies from official repositories..."
sudo pacman -S --noconfirm --needed \
    hyprland kitty dunst thunar qutebrowser \
    pipewire wireplumber xdg-desktop-portal-hyprland \
    qt6-base qt6-declarative qt6-svg wayland \
    libdrm libpipewire libxcb mesa jemalloc \
    swww pywal playerctl git || { error "Failed to install dependencies from official repositories."; exit 1; }

# Install AUR packages
info "Installing dependencies from the AUR..."
paru -S --noconfirm --needed \
    quickshell-git || { error "Failed to install dependencies from the AUR."; exit 1; }

# Clone the repository
info "Cloning the InstantRice repository to $DOTFILES_DIR..."
if [ -d "$DOTFILES_DIR" ]; then
    warning "Repository already exists at $DOTFILES_DIR. Pulling latest changes."
    cd "$DOTFILES_DIR" && git pull || { error "Failed to pull latest changes."; exit 1; }
else
    git clone -b "$REPO_BRANCH" "$REPO_URL" "$DOTFILES_DIR" || { error "Failed to clone the repository."; exit 1; }
fi

# Run the setup script
info "Running the setup script..."
cd "$DOTFILES_DIR" || { error "Failed to change directory to the repository."; exit 1; }
bash setup.sh || { error "Failed to run the setup script."; exit 1; }

success "Installation complete!"
info "The configuration files are located in $DOTFILES_DIR"
info "Please restart your system to apply all changes."

exit 0
