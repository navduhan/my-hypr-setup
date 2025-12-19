# Professional Hyprland Setup

**Author**: Naveen Duhan

A clean, reproducible, and professional Hyprland desktop environment designed for daily research and development work.

## Features

-   **Automated Installation**: Single script to install everything.
-   **Theme Management**: Hot-swappable themes (Hyprland, Waybar, Rofi, GTK) powered by a "Single Source of Truth" engine.
-   **Professional Aesthetics**: Consistent typography, colors, and rounded geometry.
-   **XWayland Support**: Optimized for HiDPI, preventing blurry apps.

## Installation

1.  Clone this repository:
    ```bash
    git clone https://github.com/your-username/my-hypr-setup.git
    cd my-hypr-setup
    ```

2.  Run the installer:
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    *The script will detect your AUR helper (yay/paru), install dependencies, back up your existing configs, and symlink the new ones.*

3.  Restart Hyprland (or log out and back in).

## Keybindings

| Key | Action |
| :--- | :--- |
| `Super + Return` | Open Terminal (Kitty) |
| `Super + Space` | Open App Launcher (Rofi) |
| `Super + Q` | Close Window |
| `Super + E` | Open File Manager (Dolphin) |
| `Super + V` | Toggle Floating |
| `Super + P` | Pseudo Tiling |
| `Super + J` | Togglesplit |
| `Super + M` | Exit Hyprland |
| `Super + Arrow / Vim Keys` | Move Focus |
| `Super + Shift + 1-0` | Move Window to Workspace |

## Theme Management

To switch themes, use the provided script:

```bash
~/.config/hypr/scripts/switch_theme.sh catppuccin-mocha
```

This will instantly update:
-   Hyprland borders
-   Waybar colors
-   Rofi theme
-   Wallpaper (swww)

## Directory Structure

-   `install.sh`: Master installer.
-   `configs/`: All dotfiles.
    -   `hypr/`: Hyprland core configs.
    -   `hypr/themes`: Theme definitions.
    -   `waybar/`: Status bar config.
-   `scripts/`: Utility scripts.

## Customization

-   **Monitors**: Edit `~/.config/hypr/monitors.conf`
-   **Rules**: Edit `~/.config/hypr/windowrules.conf`
-   **Keybinds**: Edit `~/.config/hypr/keybinds.conf`
