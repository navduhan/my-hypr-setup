-- =============================================================================
-- File: plugins/markdown.lua
-- Description: Markdown preview and rendering (similar to vimtex experience)
-- =============================================================================

return {
	-- Live browser preview (like vimtex's PDF viewer)
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			-- Auto-open preview when entering markdown file
			vim.g.mkdp_auto_start = 0
			-- Auto-close preview when leaving markdown file
			vim.g.mkdp_auto_close = 1
			-- Refresh preview on save and cursor move
			vim.g.mkdp_refresh_slow = 0
			-- Only update preview on save (set to 1 for better performance)
			vim.g.mkdp_refresh_slow = 0
			-- Use custom browser (empty = default)
			vim.g.mkdp_browser = "firefox"
			-- Preview page title
			vim.g.mkdp_page_title = "${name}"
			-- Dark theme for preview
			vim.g.mkdp_theme = "dark"
			-- Enable sync scroll
			vim.g.mkdp_preview_options = {
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				disable_filename = 0,
			}
		end,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					-- Toggle preview
					vim.keymap.set(
						"n",
						"<leader>mp",
						"<cmd>MarkdownPreviewToggle<CR>",
						{ buffer = event.buf, desc = "Toggle Markdown Preview" }
					)
					-- Start preview
					vim.keymap.set(
						"n",
						"<leader>ms",
						"<cmd>MarkdownPreview<CR>",
						{ buffer = event.buf, desc = "Start Markdown Preview" }
					)
					-- Stop preview
					vim.keymap.set(
						"n",
						"<leader>mx",
						"<cmd>MarkdownPreviewStop<CR>",
						{ buffer = event.buf, desc = "Stop Markdown Preview" }
					)
				end,
			})
		end,
	},

	-- In-buffer markdown rendering (headers, code blocks, etc.)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "quarto" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			heading = {
				enabled = true,
				sign = true,
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			},
			code = {
				enabled = true,
				sign = false,
				style = "full",
				border = "thin",
			},
			bullet = {
				enabled = true,
				icons = { "●", "○", "◆", "◇" },
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰱒 " },
			},
			quote = { icon = "▎" },
			pipe_table = {
				enabled = true,
				style = "full",
			},
			callout = {
				note = { icon = " " },
				tip = { icon = " " },
				important = { icon = " " },
				warning = { icon = " " },
				caution = { icon = " " },
			},
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					-- Toggle render
					vim.keymap.set(
						"n",
						"<leader>mr",
						"<cmd>RenderMarkdown toggle<CR>",
						{ buffer = event.buf, desc = "Toggle Markdown Render" }
					)
				end,
			})
		end,
	},

	-- Pandoc integration for PDF/DOCX export
	{
		"aspeddro/pandoc.nvim",
		ft = { "markdown", "quarto" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function(_, opts)
			require("pandoc").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					-- Export to PDF
					vim.keymap.set("n", "<leader>mP", function()
						local file = vim.fn.expand("%:p")
						local output = vim.fn.expand("%:p:r") .. ".pdf"
						vim.cmd(
							"!pandoc "
								.. vim.fn.shellescape(file)
								.. " -o "
								.. vim.fn.shellescape(output)
								.. " --pdf-engine=xelatex"
								.. " && zathura "
								.. vim.fn.shellescape(output)
								.. " &"
						)
					end, { buffer = event.buf, desc = "Export to PDF & Open" })

					-- Export to DOCX
					vim.keymap.set("n", "<leader>mD", function()
						local file = vim.fn.expand("%:p")
						local output = vim.fn.expand("%:p:r") .. ".docx"
						vim.cmd("!pandoc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(output))
						print("Exported to: " .. output)
					end, { buffer = event.buf, desc = "Export to DOCX" })

					-- Export to HTML
					vim.keymap.set("n", "<leader>mH", function()
						local file = vim.fn.expand("%:p")
						local output = vim.fn.expand("%:p:r") .. ".html"
						vim.cmd(
							"!pandoc "
								.. vim.fn.shellescape(file)
								.. " -s --toc -o "
								.. vim.fn.shellescape(output)
								.. " && xdg-open "
								.. vim.fn.shellescape(output)
						)
					end, { buffer = event.buf, desc = "Export to HTML & Open" })
				end,
			})
		end,
	},

	-- Markdown table of contents generator
	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.keymap.set(
						"n",
						"<leader>mt",
						"<cmd>GenTocGFM<CR>",
						{ buffer = event.buf, desc = "Generate TOC (GitHub)" }
					)
				end,
			})
		end,
	},
}
