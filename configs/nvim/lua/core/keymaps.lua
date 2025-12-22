-- =============================================================================
-- File: keymaps.lua
-- Description: Key mappings
-- =============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better escape
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", ":bdelete!<CR>", { desc = "Force delete buffer" })

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Clear search highlighting
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>W", ":wa<CR>", { desc = "Save all files" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })

-- Split windows
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Equal split size" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Better paste (don't overwrite register)
map("v", "p", '"_dP', opts)

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Quickfix navigation
map("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix" })
map("n", "]q", ":cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", ":cprev<CR>", { desc = "Prev quickfix" })

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Terminal
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Increment/decrement
map("n", "+", "<C-a>", { desc = "Increment" })
map("n", "-", "<C-x>", { desc = "Decrement" })

-- Replace word under cursor
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Make file executable
map("n", "<leader>mx", ":!chmod +x %<CR>", { desc = "Make executable" })

-- Source current file
map("n", "<leader><leader>x", ":source %<CR>", { desc = "Source file" })
