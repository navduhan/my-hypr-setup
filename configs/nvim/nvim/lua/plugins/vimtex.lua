-- =============================================================================
-- File: plugins/vimtex.lua
-- Description: LaTeX support
-- =============================================================================

return {
  "lervag/vimtex",
  lazy = false, -- Vimtex should not be lazy loaded to ensure reverse search works
  init = function()
    -- Use Skim on macOS for forward search (or generic open if simpler)
    -- Adjust 'view_method' based on installed PDF viewer (e.g. 'skim', 'zathura')
    vim.g.vimtex_view_method = "skim" 
    
    -- Compile on save
    vim.g.vimtex_compiler_method = "latexmk"
    
    -- Disable quickfix auto-open
    vim.g.vimtex_quickfix_mode = 0
  end,
}
