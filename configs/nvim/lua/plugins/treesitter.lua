-- =============================================================================
-- File: plugins/treesitter.lua
-- Description: Treesitter configuration (updated for nvim-treesitter rewrite)
-- =============================================================================

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- Plugin does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      -- 1. Install parsers
      -- The new API uses require("nvim-treesitter").install(list)
      local parsers = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "bash",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "vim",
        "vimdoc",
        "c",
      }

      -- Install parsers asynchronously
      require("nvim-treesitter").install(parsers)

      -- 2. Enable highlighting
      -- In the new nvim-treesitter, highlighting is manual via vim.treesitter.start()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local ok = pcall(vim.treesitter.start)
          if not ok then
            -- Fallback or silent failure if no parser exists
          end
        end,
      })

      -- 3. Enable indentation
      vim.opt.smartindent = false -- Treesitter handles indentation better
      vim.api.nvim_create_autocmd("FileType", {
          callback = function()
              local ok = pcall(function() 
                  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
              end)
          end
      })
    end,
  },
}
