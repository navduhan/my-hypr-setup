# 🎮 Keybindings Cheat Sheet

> Quick reference for Hyprland and Neovim keybindings

---

## 🖥️ Hyprland

### Applications
| Key | Action |
|-----|--------|
| `Super + Enter` | Open Terminal (Kitty) |
| `Super + Space` | App Launcher (Rofi) |
| `Super + E` | File Manager |

### Window Management
| Key | Action |
|-----|--------|
| `Super + Q` | Close Window |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle Floating |
| `Super + P` | Pseudo Tiling |
| `Super + Shift + J` | Toggle Split |
| `Super + M` | Exit Hyprland |

### Window Focus (Navigation)
| Key | Action |
|-----|--------|
| `Super + ←/→/↑/↓` | Move Focus |
| `Super + H/J/K/L` | Move Focus (Vim) |

### Move Windows
| Key | Action |
|-----|--------|
| `Super + Shift + ←/→/↑/↓` | Move Floating Window |
| `Super + Ctrl + Shift + ←/→/↑/↓` | Swap Window |

### Resize Windows
| Key | Action |
|-----|--------|
| `Super + Ctrl + ←/→/↑/↓` | Resize Window |
| `Super + LMB (drag)` | Move Window |
| `Super + RMB (drag)` | Resize Window |

### Workspaces
| Key | Action |
|-----|--------|
| `Super + 1-9,0` | Switch to Workspace 1-10 |
| `Super + Shift + 1-9,0` | Move Window to Workspace |
| `Super + Scroll` | Cycle Workspaces |

### System Controls
| Key | Action |
|-----|--------|
| `Super + R` | Reload Hyprland |
| `Super + Shift + R` | Restart Waybar |
| `Super + T` | Theme Switcher |
| `Super + N` | Notification Center |
| `Super + L` | Lock Screen |
| `Super + Shift + Q` | Power Menu (Logout) |
| `Super + Shift + P` | Monitor Menu |

### Screenshots
| Key | Action |
|-----|--------|
| `Print` | Screenshot → Clipboard |
| `Super + Print` | Screenshot → File |
| `Super + Shift + S` | Region → Clipboard |
| `Super + Shift + Print` | Region → File |

### Media & Hardware
| Key | Action |
|-----|--------|
| `Volume Up/Down` | Adjust Volume |
| `Volume Mute` | Toggle Mute |
| `Brightness Up/Down` | Adjust Brightness |
| `Play/Pause` | Media Play/Pause |
| `Prev/Next` | Media Previous/Next |

---

## 📝 Neovim

> **Leader Key: `Space`**

### Essential
| Key | Action |
|-----|--------|
| `jk` or `kj` | Exit Insert Mode |
| `Space + w` | Save File |
| `Space + W` | Save All Files |
| `Space + q` | Quit |
| `Space + Q` | Force Quit All |

### Navigation
| Key | Action |
|-----|--------|
| `Ctrl + h/j/k/l` | Navigate Windows |
| `Shift + h` | Previous Buffer |
| `Shift + l` | Next Buffer |
| `Ctrl + d` | Scroll Down (centered) |
| `Ctrl + u` | Scroll Up (centered) |

### Window Splits
| Key | Action |
|-----|--------|
| `Space + sv` | Split Vertical |
| `Space + sh` | Split Horizontal |
| `Space + se` | Equal Split Size |
| `Space + sx` | Close Split |
| `Ctrl + ↑/↓/←/→` | Resize Splits |

### Buffers & Tabs
| Key | Action |
|-----|--------|
| `Space + bd` | Delete Buffer |
| `Space + bD` | Force Delete Buffer |
| `Space + bp` | Pin Buffer |
| `Space + to` | New Tab |
| `Space + tx` | Close Tab |
| `Space + tn/tp` | Next/Prev Tab |

### Editing
| Key | Action |
|-----|--------|
| `Alt + j/k` | Move Line Down/Up |
| `<` / `>` (visual) | Indent Left/Right |
| `p` (visual) | Paste (keep register) |
| `Ctrl + a` | Select All |
| `+` / `-` | Increment/Decrement |
| `Space + rw` | Replace Word Under Cursor |

### Search & Replace
| Key | Action |
|-----|--------|
| `Space + nh` | Clear Search Highlight |
| `Space + sr` | Search & Replace (Spectre) |
| `n` / `N` | Next/Prev Search (centered) |

### File Explorer (Neo-tree)
| Key | Action |
|-----|--------|
| `Space + e` | Toggle File Explorer |
| `Space + fe` | Reveal Current File |

### Telescope (Fuzzy Finder)
| Key | Action |
|-----|--------|
| `Space + Space` | Find Files |
| `Space + ff` | Find Files |
| `Space + fg` | Live Grep (Search Text) |
| `Space + fb` | Find Buffers |
| `Space + fr` | Recent Files |
| `Space + fh` | Help Tags |
| `Space + fc` | Find Word Under Cursor |
| `Space + fk` | Keymaps |
| `Space + fm` | Marks |
| `Space + /` | Grep Text |
| `Space + ,` | Switch Buffer |
| `Space + :` | Command History |
| `Space + ft` | Find Todos |

### LSP (Code Intelligence)
| Key | Action |
|-----|--------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `gI` | Go to Implementation |
| `gy` | Go to Type Definition |
| `gD` | Go to Declaration |
| `K` | Hover Documentation |
| `gK` | Signature Help |
| `Space + ca` | Code Action |
| `Space + cr` | Rename Symbol |
| `Space + cf` | Format Code |
| `Space + cl` | LSP Info |

### Diagnostics
| Key | Action |
|-----|--------|
| `[d` / `]d` | Prev/Next Diagnostic |
| `Space + d` | Show Diagnostic Float |
| `Space + xx` | Toggle Diagnostics List |
| `Space + xX` | Buffer Diagnostics |
| `Space + xl` | Location List |
| `Space + xq` | Quickfix List |

### Git
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next/Prev Hunk |
| `Space + ghs` | Stage Hunk |
| `Space + ghr` | Reset Hunk |
| `Space + ghS` | Stage Buffer |
| `Space + ghu` | Undo Stage Hunk |
| `Space + ghR` | Reset Buffer |
| `Space + ghp` | Preview Hunk |
| `Space + ghb` | Blame Line |
| `Space + ghd` | Diff This |
| `Space + gtb` | Toggle Line Blame |
| `Space + gc` | Git Commits |
| `Space + gs` | Git Status |
| `Space + gb` | Git Branches |

### Terminal
| Key | Action |
|-----|--------|
| `Ctrl + \` | Toggle Terminal |
| `Space + tf` | Float Terminal |
| `Space + th` | Horizontal Terminal |
| `Space + tv` | Vertical Terminal |
| `Space + tg` | Lazygit |
| `Esc` (in term) | Exit Terminal Mode |

### Motion (Flash)
| Key | Action |
|-----|--------|
| `s` | Flash Jump |
| `S` | Flash Treesitter |
| `r` (operator) | Remote Flash |

### Comments
| Key | Action |
|-----|--------|
| `gcc` | Toggle Line Comment |
| `gc` (visual) | Toggle Selection Comment |
| `gbc` | Toggle Block Comment |

### Surround
| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add Surround |
| `ds{char}` | Delete Surround |
| `cs{old}{new}` | Change Surround |

### Todos
| Key | Action |
|-----|--------|
| `]t` / `[t` | Next/Prev Todo |
| `Space + ft` | Find Todos |

### References
| Key | Action |
|-----|--------|
| `]]` / `[[` | Next/Prev Reference |

### Quickfix
| Key | Action |
|-----|--------|
| `Space + co` | Open Quickfix |
| `Space + cc` | Close Quickfix |
| `]q` / `[q` | Next/Prev Quickfix |

### Misc
| Key | Action |
|-----|--------|
| `Space + mx` | Make File Executable |
| `Space + Space + x` | Source Current File |
| `Space + un` | Dismiss Notifications |

---

## 📋 Quick Commands

### Neovim Commands
```vim
:Mason          " Manage LSP servers
:Lazy           " Plugin manager
:checkhealth    " Check Neovim health
:TSInstall      " Install treesitter parser
:LspInfo        " LSP status
:ConformInfo    " Formatter info
```

### Theme Switching
```bash
# From terminal
~/.config/hypr/scripts/switch_theme.sh <theme>

# Available themes:
# catppuccin-mocha, catppuccin-latte, tokyo-night, dracula,
# nord, gruvbox-dark, everforest, rose-pine, one-dark, solarized-dark
```

---

<p align="center">
  <b>Pro Tips:</b><br>
  • Press <code>Space</code> and wait to see available keybindings (which-key)<br>
  • Use <code>:Telescope keymaps</code> to search all keybindings<br>
  • Check <code>:checkhealth</code> if something isn't working
</p>
