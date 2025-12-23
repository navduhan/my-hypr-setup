-- Python specific settings
local opt = vim.opt_local

-- Indentation (Standard 4 spaces)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Auto-indentation
opt.autoindent = true
opt.smartindent = true

-- Text width (PEP 8 standard is 79, common modern is 88 or 100)
opt.textwidth = 100
opt.formatoptions = opt.formatoptions + "t" -- Auto-wrap text using textwidth
