-- =============================================================================
-- File: plugins/opencode.lua
-- Description: OpenCode AI Assistant integration
-- =============================================================================

return {
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			-- Required for ask() and select()
			{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				provider = {
					enabled = "tmux",
					tmux = {
						-- Opens opencode in a new tmux pane
					},
				},
			}

			-- Required for opts.events.reload (auto-reload buffers when opencode edits files)
			vim.o.autoread = true

			-- Keymaps for opencode using <leader>o prefix
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "Ask opencode" })

			vim.keymap.set({ "n", "x" }, "<leader>oc", function()
				require("opencode").select()
			end, { desc = "Execute opencode command" })

			vim.keymap.set({ "n", "t" }, "<leader>ot", function()
				require("opencode").toggle()
			end, { desc = "Toggle opencode" })

			-- Operator keymaps for adding ranges to opencode
			vim.keymap.set({ "n", "x" }, "<leader>or", function()
				return require("opencode").operator("@this ")
			end, { expr = true, desc = "Add range to opencode" })

			vim.keymap.set("n", "<leader>ol", function()
				return require("opencode").operator("@this ") .. "_"
			end, { expr = true, desc = "Add line to opencode" })

			-- Scroll opencode conversation
			vim.keymap.set("n", "<leader>ou", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Opencode scroll up" })

			vim.keymap.set("n", "<leader>od", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Opencode scroll down" })
		end,
	},
}
