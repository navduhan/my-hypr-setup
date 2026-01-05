-- =============================================================================
-- File: plugins/copilot.lua
-- Description: Github Copilot configuration (using copilot.vim)
-- =============================================================================

return {
  -- Copilot Core (Vim version)
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    init = function()
      -- For copilot.vim, we use global variables for configuration
      -- These should be set before the plugin is loaded, so we use 'init'
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      }
    end,
    config = function()
      vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = "CopilotChat",
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Explain" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Copilot Fix" },
      { "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Copilot Review" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize" },
    },
    opts = {
      debug = true,
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = "editor",
        border = "single",
        row = nil,
        col = nil,
        title = "Copilot Chat",
        footer = nil,
        zindex = 1,
      },
    },
  },
}