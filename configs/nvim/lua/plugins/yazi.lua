return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "Open Yazi in current working directory",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, there is optional advice:
      -- https://github.com/mikavilpas/yazi.nvim#replacing-netrw
      open_for_directories = false,
      
      -- Enable floating window mode
      yazi_floating_window_winblend = 0,
      yazi_floating_window_scaling_factor = 0.8,
      yazi_type = "floating", -- ensures it opens in a floating window
      
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
