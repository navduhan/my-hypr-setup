-- =============================================================================
-- File: plugins/remote.lua
-- Description: Remote development support (similar to VSCode Remote-SSH)
-- =============================================================================

return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to the latest version
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "RemoteStart", "RemoteStop", "RemoteInfo", "RemoteCleanup", "RemoteLog" },
    config = true, -- Calls require("remote-nvim").setup()
  },
}
