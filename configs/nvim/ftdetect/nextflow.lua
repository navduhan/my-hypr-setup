-- Nextflow filetype detection
vim.filetype.add({
  extension = {
    nf = "nextflow",
    config = function(path, bufnr)
      if path:match("nextflow%.config$") then
        return "nextflow"
      end
    end,
  },
  filename = {
    ["nextflow.config"] = "nextflow",
  },
  pattern = {
    [".*%.nf"] = "nextflow",
    ["nextflow%.config"] = "nextflow",
  },
})
