-- =============================================================================
-- File: plugins/csv.lua
-- Description: CSV/TSV handling and alignment
-- =============================================================================

return {
  {
    "chrisbra/csv.vim",
    ft = { "csv", "tsv", "tab" },
    init = function()
      -- Auto-align on read (optional, can be slow on large files)
      vim.g.csv_autocmd_arrange = 0
      -- Use specific column width
      -- vim.g.csv_column_width = 10
      -- Highlight column under cursor
      vim.g.csv_highlight_column = 'y'
    end,
    config = function()
      -- Map <leader>aa to Align All columns
      vim.keymap.set("n", "<leader>aa", ":%ArrangeColumn<CR>", { desc = "Align All Columns (CSV/TSV)", silent = true })
      -- Map <leader>au to Unalign All columns
      vim.keymap.set("n", "<leader>au", ":%UnArrangeColumn<CR>", { desc = "Unalign All Columns (CSV/TSV)", silent = true })
    end,
  },
}
