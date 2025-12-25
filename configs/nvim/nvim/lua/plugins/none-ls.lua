-- =============================================================================
-- File: plugins/none-ls.lua
-- Description: Null-ls / None-ls configuration for formatting and linting
-- =============================================================================

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    
    null_ls.setup({
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shfmt,
        
        -- Latex (Extras)
        require("none-ls.formatting.latexindent"),
        
        -- Python (Extras)
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Python Linting (Extras)
        require("none-ls.diagnostics.flake8"),

        -- Prose Linting (Builtin)
        -- null_ls.builtins.diagnostics.vale, (Disabled by user request)
      },
    })
  end,
}

