-- =============================================================================
-- File: plugins/colorscheme.lua
-- Description: Colorscheme plugins
-- =============================================================================

return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        indent_blankline = { enabled = true },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
  },

  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
    },
  },

  -- Dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    opts = {
      transparent_bg = true,
    },
  },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    config = function()
      vim.g.nord_disable_background = true
    end,
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      transparent_mode = true,
    },
  },

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      disable_background = true,
    },
  },

  -- One Dark
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      style = "dark",
      transparent = true,
    },
  },

  -- Everforest
  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      vim.g.everforest_transparent_background = 1
    end,
  },

  -- Solarized
  {
    "maxmx03/solarized.nvim",
    lazy = true,
    opts = {
      transparent = { enabled = true },
    },
  },
}
