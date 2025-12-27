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
		vim.g.vimtex_view_method = "zathura"

		-- Compile on save using latexmk (automates bibtex/references)
		vim.g.vimtex_compiler_method = "latexmk"

		-- Configure latexmk to ALWAYS use lualatex (for fonts/unicode)
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-lualatex",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- Enable quickfix auto-open (2 = open on error)
		vim.g.vimtex_quickfix_mode = 2

		-- Specify files to clean
		vim.g.vimtex_clean_additional_extensions = { "aux", "bbl", "blg", "fls", "out", "fdb_latexmk", "gz" }

		-- Keymap for Cleaning files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function(event)
				local wk = require("which-key")

				-- Clean
				vim.keymap.set(
					"n",
					"<leader>lc",
					"<cmd>VimtexClean<CR>",
					{ buffer = event.buf, desc = "Clean Aux Files" }
				)

				-- Compile with LuaLaTeX
				vim.keymap.set("n", "<leader>ll", function()
					vim.g.vimtex_compiler_latexmk = {
						build_dir = "",
						callback = 1,
						continuous = 1,
						executable = "latexmk",
						hooks = {},
						options = {
							"-verbose",
							"-file-line-error",
							"-synctex=1",
							"-interaction=nonstopmode",
							"-lualatex", -- Switch to lualatex
						},
					}
					vim.cmd("VimtexCompile")
					print("Switched to LuaLaTeX and started compilation")
				end, { buffer = event.buf, desc = "Compile with LuaLaTeX" })
			end,
		})
	end,
}
