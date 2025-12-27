-- =============================================================================
-- File: plugins/cursor-agent.lua
-- Description: Cursor Agent (AI) integration
-- =============================================================================

return {
	"xTacobaco/cursor-agent.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "CursorAgent", "CursorAgentSelection", "CursorAgentBuffer" },
    keys = {
        { "<leader>ca", "<cmd>CursorAgent<CR>", desc = "Cursor Agent: Toggle terminal" },
        { "<leader>ca", "<cmd>CursorAgentSelection<CR>", desc = "Cursor Agent: Send selection", mode = "v" },
        { "<leader>cA", "<cmd>CursorAgentBuffer<CR>", desc = "Cursor Agent: Send buffer" },
    },
	config = function()
		require("cursor-agent").setup({
			-- cmd = "cursor-agent", -- default
			-- args = {}, -- default
		})
	end,
}