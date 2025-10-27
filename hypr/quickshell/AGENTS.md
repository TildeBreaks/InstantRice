# Agent Instructions for QuickShell Integration

This document provides guidance for AI agents working on the QuickShell integration for this Hyprland configuration.

## Project Goal

The primary goal of this project is to replace the existing Waybar status bar with a new, custom-built UI using QuickShell. The new UI should be modular, visually appealing, and compatible with both the Hyprland and MangoWC Wayland compositors. The desired aesthetic is a "High Fantasy meets Cyberpunk" theme with a 16-bit RPG feel.

## Current Architecture

The QuickShell configuration is located in the `hypr/quickshell` directory and follows a modular design pattern:

*   **`shell.qml`**: The main entry point for the QuickShell environment. It loads the `Drawer.qml` component.
*   **`Drawer.qml`**: A full-screen, transparent window that acts as the main container for all UI elements. It is responsible for loading the `Bar.qml`.
*   **`Bar.qml`**: The main component for the status bar. It contains the layout and widgets for the bar.
*   **`components/Workspaces.qml`**: A compositor-agnostic component for displaying workspaces or tags. It uses a `Loader` to dynamically load a backend based on the running compositor.
*   **`components/workspaces/`**: This directory contains the compositor-specific backends:
    *   **`HyprlandWorkspaces.qml`**: A fully functional backend for Hyprland that displays workspaces for all connected monitors.
    *   **`MangoWCWorkspaces.qml`**: A placeholder backend for MangoWC.

## Next Steps & Future Development

The following are the key areas for future development:

1.  **Implement MangoWC Backend**: The `MangoWCWorkspaces.qml` is currently a placeholder. To complete MangoWC support, a command-line tool needs to be created to communicate with the MangoWC IPC and fetch tag information. Once this tool is available, this file should be updated to use it.
2.  **Develop the "High Fantasy meets Cyberpunk" Theme**: The current UI is functional but lacks the desired 16-bit RPG aesthetic. The next phase of development should focus on theming the UI with custom fonts, colors, icons, and pixel art.
3.  **Expand Functionality**: Once the theme is in place, the following features can be added:
    *   A music player widget (with support for `playerctl`).
    *   A wallpaper switcher with `pywal` integration.
    *   Expandable widgets for more detailed information (inspired by soramane's configuration).
    *   Customizable desktop widgets (e.g., clocks, calendars, system monitors).
