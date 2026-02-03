-- =============================================================================
-- File: plugins/opencode.lua
-- Description: OpenCode AI Assistant integration
-- =============================================================================

return {
    {
        "NickvanDyke/opencode.nvim",
        branch = "main", -- Use main branch for latest updates
        dependencies = {
            -- Required for ask() and select()
            { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
        },
        config = function()
            -- Auto-detect provider: use tmux if inside tmux, otherwise use snacks terminal
            local provider_name = vim.env.TMUX and "tmux" or "snacks"

            vim.g.opencode_opts = {
                provider = {
                    enabled = provider_name,
                    tmux = {
                        options = "-h", -- Opens opencode in a horizontal split
                    },
                    snacks = {
                        auto_close = true,
                        win = {
                            position = "right",
                            enter = false,
                        },
                    },
                },
            }

            -- Required for opts.events.reload (auto-reload buffers when opencode edits files)
            vim.o.autoread = true

            -- Keymaps: <leader>o + one letter = 3 keys total (e.g. space-o-l for "add line")
            -- Avoid <leader>ot so typing "other" doesn't trigger; use "e" for toggle (open/engage)
            vim.keymap.set({ "n", "x" }, "<leader>oa", function()
                require("opencode").ask("@this: ", { submit = true })
            end, { desc = "Ask opencode" })

            vim.keymap.set({ "n", "x" }, "<leader>oc", function()
                require("opencode").select()
            end, { desc = "Opencode command" })

            vim.keymap.set({ "n", "t" }, "<leader>oe", function()
                require("opencode").toggle()
            end, { desc = "Toggle opencode" })

            vim.keymap.set({ "n", "x" }, "<leader>or", function()
                return require("opencode").operator("@this ")
            end, { expr = true, desc = "Add range to opencode" })

            vim.keymap.set("n", "<leader>ol", function()
                return require("opencode").operator("@this ") .. "_"
            end, { expr = true, desc = "Add line to opencode" })

            vim.keymap.set("n", "<leader>ou", function()
                require("opencode").command("session.half.page.up")
            end, { desc = "Opencode scroll up" })

            vim.keymap.set("n", "<leader>od", function()
                require("opencode").command("session.half.page.down")
            end, { desc = "Opencode scroll down" })

            vim.keymap.set("n", "<leader>os", function()
                require("opencode").select_session()
            end, { desc = "Select opencode session" })
        end,
    },
}
