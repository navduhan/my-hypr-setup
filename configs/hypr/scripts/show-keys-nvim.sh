#!/bin/bash
# -----------------------------------------------------------------------------
# File: show-keys-nvim.sh
# Description: Display Neovim keybindings cheat sheet
# -----------------------------------------------------------------------------

rofi -dmenu -i -markup-rows -p " Neovim Keys" -theme-str '
window {
    width: 1600px;
    height: 85%;
}
listview {
    lines: 35;
    columns: 4;
    scrollbar: true;
}
element {
    padding: 8px 12px;
}
element-text {
    font: "JetBrainsMono Nerd Font 11";
}
' <<EOF
<b>━━━ Leader Key: Space ━━━</b>

<b>━━━ Essential ━━━</b>
jk / kj                Exit Insert Mode
Space + w              Save File
Space + W              Save All
Space + q              Quit
Space + Q              Force Quit All

<b>━━━ Navigation ━━━</b>
Ctrl + h/j/k/l         Navigate Windows
Shift + h              Previous Buffer
Shift + l              Next Buffer
Ctrl + d/u             Scroll Down/Up (centered)

<b>━━━ Window Splits ━━━</b>
Space + sv             Split Vertical
Space + sh             Split Horizontal
Space + se             Equal Size
Space + sx             Close Split
Ctrl + ↑/↓/←/→         Resize Split

<b>━━━ Buffers ━━━</b>
Space + bd             Delete Buffer
Space + bD             Force Delete Buffer
Space + bp             Pin Buffer

<b>━━━ File Explorer ━━━</b>
Space + e              Toggle Explorer
Space + fe             Reveal File

<b>━━━ Telescope (Find) ━━━</b>
Space + Space          Find Files
Space + ff             Find Files
Space + fg             Grep Text
Space + fb             Find Buffers
Space + fr             Recent Files
Space + fh             Help Tags
Space + fc             Word Under Cursor
Space + fk             Keymaps
Space + ft             Find Todos
Space + /              Grep Text
Space + ,              Switch Buffer

<b>━━━ LSP (Code) ━━━</b>
gd                     Go to Definition
gr                     Go to References
gI                     Go to Implementation
gy                     Go to Type Definition
gD                     Go to Declaration
K                      Hover Documentation
gK                     Signature Help
Space + ca             Code Action
Space + cr             Rename Symbol
Space + cf             Format Code
Space + cl             LSP Info

<b>━━━ Diagnostics ━━━</b>
[d / ]d                Prev/Next Diagnostic
Space + d              Show Diagnostic
Space + xx             Toggle Diagnostics
Space + xX             Buffer Diagnostics

<b>━━━ Git ━━━</b>
]h / [h                Next/Prev Hunk
Space + ghs            Stage Hunk
Space + ghr            Reset Hunk
Space + ghp            Preview Hunk
Space + ghb            Blame Line
Space + ghd            Diff This
Space + gc             Git Commits
Space + gs             Git Status

<b>━━━ Terminal ━━━</b>
Ctrl + \\              Toggle Terminal
Space + tf             Float Terminal
Space + th             Horizontal Terminal
Space + tv             Vertical Terminal
Space + tg             Lazygit

<b>━━━ Motion (Flash) ━━━</b>
s                      Flash Jump
S                      Flash Treesitter

<b>━━━ Editing ━━━</b>
Alt + j/k              Move Line Down/Up
< / > (visual)         Indent
gcc                    Toggle Line Comment
gc (visual)            Comment Selection

<b>━━━ Surround ━━━</b>
ys{motion}{char}       Add Surround
ds{char}               Delete Surround
cs{old}{new}           Change Surround

<b>━━━ Misc ━━━</b>
Space + nh             Clear Search Highlight
Space + sr             Search & Replace
Space + rw             Replace Word
Space + mx             Make Executable
]] / [[                Next/Prev Reference
EOF
