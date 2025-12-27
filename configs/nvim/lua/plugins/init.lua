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
  { import = "plugins.cursor-agent" },
  { import = "plugins.copilot" },
  { import = "plugins.gemini" },
  { import = "plugins.none-ls" },
  { import = "plugins.remote" },
  { import = "plugins.tmux" },
  { import = "plugins.vimtex" },
}
