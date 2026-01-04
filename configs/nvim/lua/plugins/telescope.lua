-- =============================================================================
-- File: plugins/telescope.lua
-- Description: Telescope fuzzy finder configuration
-- =============================================================================

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function() return vim.fn.executable("make") == 1 end,
      },
      {
        "nvim-telescope/telescope-bibtex.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
      },
    },
    keys = {
      -- Citations
      { "<leader>sc", "<cmd>Telescope bibtex<cr>", desc = "Search Citations" },
      -- Find
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      -- Quick access
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep text" },
      { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Switch buffer" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      -- Git
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      -- Search
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = "  ",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            width = 0.87,
            height = 0.80,
          },
          winblend = 0, -- Set to 0 for solid background, or 10-30 for slight transparency
          file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-c>"] = actions.close,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = { "--hidden" } },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "bibtex")

      -- Apply Telescope highlights that follow the colorscheme
      local function set_telescope_highlights()
        local colors = {}
        -- Get colors from current colorscheme's Normal and other highlight groups
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
        local cursor_line = vim.api.nvim_get_hl(0, { name = "CursorLine" })
        local title = vim.api.nvim_get_hl(0, { name = "Title" })
        local border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })

        -- Use NormalFloat bg if available, otherwise create a slightly different bg
        local bg = normal_float.bg or normal.bg
        local selection_bg = cursor_line.bg

        if bg then
          -- Telescope prompt
          vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg, fg = normal.fg })
          vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg, fg = normal.fg })
          vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg, fg = normal.fg })
          vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg, fg = normal.fg })

          -- Borders
          vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = bg, fg = border.fg or normal.fg })
          vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = bg, fg = border.fg or normal.fg })
          vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = bg, fg = border.fg or normal.fg })
          vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = bg, fg = border.fg or normal.fg })

          -- Titles
          vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = bg, fg = title.fg, bold = true })
          vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = bg, fg = title.fg, bold = true })
          vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = bg, fg = title.fg, bold = true })
          vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = bg, fg = title.fg, bold = true })

          -- Selection
          if selection_bg then
            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = selection_bg, fg = normal.fg, bold = true })
          end
        end
      end

      -- Apply highlights now and whenever colorscheme changes
      set_telescope_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_telescope_highlights,
        desc = "Apply Telescope highlights based on colorscheme",
      })
    end,
  },
}
