-- =============================================================================
-- File: options.lua
-- Description: Neovim options and settings
-- =============================================================================

local opt = vim.opt

-- Set python3 host explicitly
vim.g.python3_host_prog = "/Users/naveen/miniconda3/envs/ngs/bin/python3"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false
opt.linebreak = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.showmode = false
opt.cmdheight = 1
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 10
opt.laststatus = 3 -- Global statusline

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.modifiable = true
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c")

-- Folding (treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.redrawtime = 1500
opt.ttimeoutlen = 10
opt.lazyredraw = false

-- Spelling
opt.spell = false
opt.spelllang = { "en_us" }

-- Fill chars
opt.fillchars = {
  fold = " ",
  diff = "/",
  eob = " ",
}

-- List chars (show invisible characters)
opt.list = true
opt.listchars = {
  tab = "> ",
  trail = "-",
  extends = ">",
  precedes = "<",
  nbsp = "+",
}

-- Grep
opt.grepprg = "rg --vimgrep --smart-case --hidden"
opt.grepformat = "%f:%l:%c:%m"