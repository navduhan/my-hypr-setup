# Professional Hyprland Setup

**Author**: Naveen Duhan

A clean, reproducible, and professional Hyprland desktop environment designed for daily research and development work.

## Features

- **Automated Installation**: Single script to install everything
- **Theme Management**: 10 hot-swappable themes across all apps
- **Modern Neovim**: Full IDE experience with LSP, completion, and more
- **Beautiful UI**: Consistent design with glassmorphism effects
- **XWayland Support**: Optimized for HiDPI displays

## Quick Start

```bash
git clone https://github.com/your-username/my-hypr-setup.git
cd my-hypr-setup
chmod +x install.sh
./install.sh
```

Then restart Hyprland (log out and back in).

## 📋 Keybindings

**See [CHEATSHEET.md](CHEATSHEET.md) for complete keybindings reference!**

### Essential Keys

| Key | Action |
|-----|--------|
| `Super + Enter` | Terminal |
| `Super + Space` | App Launcher |
| `Super + Q` | Close Window |
| `Super + E` | File Manager |
| `Super + T` | Theme Switcher |
| `Super + N` | Notifications |
| `Super + L` | Lock Screen |
| `Super + Shift + Q` | Power Menu |

## 🎨 Themes

Switch themes instantly:

```bash
~/.config/hypr/scripts/switch_theme.sh <theme-name>
```

**Available themes:**
- `catppuccin-mocha` / `catppuccin-latte`
- `tokyo-night`
- `dracula`
- `nord`
- `gruvbox-dark`
- `everforest`
- `rose-pine`
- `one-dark`
- `solarized-dark`

Theme switching updates:
- Hyprland borders & colors
- Waybar
- Rofi
- Kitty terminal
- SwayNC notifications
- Wlogout
- Hyprlock
- Neovim colorscheme
- Wallpaper

## 📝 Neovim

Full IDE setup with modern plugins. First launch will auto-install plugins.

### Features

| Feature | Plugin |
|---------|--------|
| Plugin Manager | lazy.nvim |
| LSP | mason.nvim + nvim-lspconfig |
| Completion | nvim-cmp + LuaSnip |
| Fuzzy Finder | telescope.nvim |
| File Explorer | neo-tree.nvim |
| Git | gitsigns.nvim |
| Status Line | lualine.nvim |
| Syntax | treesitter |
| Motion | flash.nvim |
| Formatting | conform.nvim |

### Quick Keys (Leader = Space)

| Key | Action |
|-----|--------|
| `Space + e` | File Explorer |
| `Space + ff` | Find Files |
| `Space + fg` | Search Text |
| `Space + w` | Save |
| `gd` | Go to Definition |
| `K` | Hover Docs |
| `Ctrl + \` | Terminal |
| `Space + tg` | Lazygit |

### LSP Servers

Run `:Mason` to manage servers. Pre-configured:
- Lua, Python, TypeScript/JavaScript
- HTML, CSS, JSON, YAML
- Bash, Go, Rust

## 📁 Directory Structure

```
my-hypr-setup/
├── install.sh              # Master installer
├── CHEATSHEET.md           # Keybindings reference
├── README.md
└── configs/
    ├── hypr/
    │   ├── hyprland.conf   # Main config
    │   ├── keybinds.conf   # Keybindings
    │   ├── monitors.conf   # Display setup
    │   ├── windowrules.conf
    │   ├── scripts/
    │   │   └── switch_theme.sh
    │   └── themes/         # 10 theme configs
    ├── nvim/               # Neovim config
    ├── waybar/
    ├── rofi/
    ├── kitty/
    ├── swaync/
    └── wlogout/
```

## ⚙️ Customization

| What | File |
|------|------|
| Monitors | `~/.config/hypr/monitors.conf` |
| Keybinds | `~/.config/hypr/keybinds.conf` |
| Window Rules | `~/.config/hypr/windowrules.conf` |
| Neovim | `~/.config/nvim/lua/` |

## 🔧 Troubleshooting

```bash
# Check Neovim health
nvim +checkhealth

# Reinstall Neovim plugins
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
nvim  # Plugins auto-install

# Reload Hyprland
Super + R

# Restart Waybar
Super + Shift + R
```

---

<p align="center">Made with ❤️ for the Hyprland community</p>
