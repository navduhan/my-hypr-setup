#!/bin/bash
# -----------------------------------------------------------------------------
# File: show-keys-hyprland.sh
# Description: Display Hyprland keybindings cheat sheet
# -----------------------------------------------------------------------------

rofi -dmenu -i -markup-rows -p "󰌌 Hyprland Keys" -theme-str '
window {
    width: 700px;
    height: 80%;
}
listview {
    lines: 30;
    scrollbar: true;
}
element {
    padding: 8px 12px;
}
element-text {
    font: "JetBrainsMono Nerd Font 11";
}
' <<EOF
<b>━━━ Applications ━━━</b>
Super + Enter          Terminal (Kitty)
Super + Space          App Launcher (Rofi)
Super + E              File Manager

<b>━━━ Window Management ━━━</b>
Super + Q              Close Window
Super + F              Fullscreen
Super + V              Toggle Floating
Super + P              Pseudo Tiling
Super + Shift + J      Toggle Split
Super + M              Exit Hyprland

<b>━━━ Window Focus ━━━</b>
Super + ←/→/↑/↓        Move Focus (Arrows)
Super + H/J/K/L        Move Focus (Vim)

<b>━━━ Move Windows ━━━</b>
Super + Shift + ←/→/↑/↓         Move Floating Window
Super + Ctrl + Shift + ←/→/↑/↓  Swap Window

<b>━━━ Resize Windows ━━━</b>
Super + Ctrl + ←/→/↑/↓  Resize Window
Super + LMB (drag)      Move Window
Super + RMB (drag)      Resize Window

<b>━━━ Workspaces ━━━</b>
Super + 1-9,0          Switch to Workspace
Super + Shift + 1-9,0  Move Window to Workspace
Super + Scroll         Cycle Workspaces

<b>━━━ System ━━━</b>
Super + R              Reload Hyprland
Super + Shift + R      Restart Waybar
Super + T              Theme Switcher
Super + N              Notification Center
Super + L              Lock Screen
Super + Shift + Q      Power Menu
Super + Shift + P      Monitor Menu

<b>━━━ Screenshots ━━━</b>
Print                  Full Screen → Clipboard
Super + Print          Full Screen → File
Super + Shift + S      Region → Clipboard
Super + Shift + Print  Region → File

<b>━━━ Media ━━━</b>
Volume Keys            Adjust Volume
Brightness Keys        Adjust Brightness
Play/Pause             Media Control

<b>━━━ Help ━━━</b>
Super + K              This Cheat Sheet
Super + Shift + N      Neovim Cheat Sheet
EOF
