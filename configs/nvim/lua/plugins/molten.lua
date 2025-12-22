-- =============================================================================
-- File: plugins/molten.lua
-- Description: Jupyter-style Python execution with Molten and Image.nvim
-- =============================================================================

return {
  -- Molten: The Jupyter Kernel Client
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- Use version 1.x
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- Keymaps
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Molten Init", silent = true })
      vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "Molten Evaluate Operator", silent = true })
      vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Molten Evaluate Line", silent = true })
      vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Molten Evaluate Visual", silent = true })
      vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Molten Delete Cell", silent = true })
      vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Molten Hide Output", silent = true })
      vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", { desc = "Molten Enter Output", silent = true })
    end,
    opts = {
      output_win_max_height = 20,
    },
  },

  -- Image.nvim: For inline images (requires Kitty, WezTerm, etc.)
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Using kitty as per your file structure
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },

  -- Optional: Quarto for a better notebook experience (markdown + code)
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html" },
        chunks = "curly", -- 'curly' or 'all'
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "K",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
      },
    },
  },
}
