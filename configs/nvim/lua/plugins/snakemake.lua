-- =============================================================================
-- File: snakemake.lua
-- Description: Snakemake workflow syntax support
-- =============================================================================

return {
  {
    "snakemake/snakemake",
    ft = { "snakemake", "smk" },
    config = function()
      -- Set up filetype detection
      vim.filetype.add({
        extension = {
          smk = "snakemake",
        },
        filename = {
          ["Snakefile"] = "snakemake",
        },
        pattern = {
          [".*%.smk"] = "snakemake",
          [".*%.snake"] = "snakemake",
          ["Snakefile.*"] = "snakemake",
        },
      })
    end,
    init = function()
      -- Add Snakemake runtime path
      vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/snakemake/misc/vim")
    end,
  },
}
