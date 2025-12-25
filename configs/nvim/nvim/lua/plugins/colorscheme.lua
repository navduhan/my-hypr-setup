-- =============================================================================
-- File: plugins/colorscheme.lua
-- Description: Colorscheme plugins
-- =============================================================================

return {
  -- One Dark (Active)
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark", -- Ensure "dark" style (not "warmer", "cool", etc.)
      transparent = false, -- Force opaque background to prevent "white" look if term is light
      term_colors = true,
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      vim.cmd.colorscheme("onedark")
    end,
  },

  -- Catppuccin (Fallback / Alternative)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true, -- Lazy load so it doesn't conflict during startup
    opts = {
      flavour = "mocha",
      transparent_background = false,
    },
  },
}
