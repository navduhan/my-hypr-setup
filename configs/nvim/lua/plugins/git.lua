-- =============================================================================
-- File: plugins/git.lua
-- Description: Git integration plugins
-- =============================================================================

return {
  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(buffer)
        local gitsigns = require("gitsigns")
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        -- Navigation
        map("n", "]h", function() gitsigns.nav_hunk("next") end, "Next Hunk")
        map("n", "[h", function() gitsigns.nav_hunk("prev") end, "Prev Hunk")
        -- Actions
        map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage Hunk")
        map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset Hunk")
        map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gitsigns.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gitsigns.diffthis, "Diff This")
        map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, "Toggle Blame")
      end,
    },
  },
}
