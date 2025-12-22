-- =============================================================================
-- File: plugins/init.lua
-- Description: Plugin specifications for lazy.nvim
-- =============================================================================

return {
  -- Import plugin modules
  { import = "plugins.colorscheme" },
  { import = "plugins.ui" },
  { import = "plugins.editor" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.telescope" },
  { import = "plugins.git" },
  { import = "plugins.molten" },
}
