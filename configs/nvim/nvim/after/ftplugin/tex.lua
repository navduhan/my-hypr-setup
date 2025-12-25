-- =============================================================================
-- File: after/ftplugin/tex.lua
-- Description: LaTeX specific settings and keymaps
-- =============================================================================

local map = vim.keymap.set
local opts = { buffer = true, silent = true }

-- Citations: Open Telescope Bibtex
-- Normal mode: <leader>c
map("n", "<leader>c", "<cmd>Telescope bibtex<CR>", { desc = "Search Citations", buffer = true })

-- Insert mode: <C-c> (Ctrl+c) to open picker and insert citation
map("i", "<C-c>", "<cmd>Telescope bibtex<CR>", { desc = "Search Citations", buffer = true })

-- Optional: Map \cite in insert mode to open telescope (if user strictly wants that)
-- Warning: This might interfere with typing if not handled carefully, 
-- but since \ is a leader-like key in insert, it usually waits. 
-- However, standard abbreviation works better.
-- Let's stick to <C-c> as it is robust.
