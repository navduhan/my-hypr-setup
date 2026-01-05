-- =============================================================================
-- File: plugins/persistence.lua
-- Description: Session management
-- =============================================================================

return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
    config = function(_, opts)
      require("persistence").setup(opts)
      -- Add WhichKey integration if available
      local ok, wk = pcall(require, "which-key")
      if ok then
        wk.add({
          { "<leader>q", group = "+session" },
        })
      end
    end,
  },
}
