return {
  "Vigemus/iron.nvim",
  event = "VeryLazy",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          python = {
            command = function()
              local venv = vim.env.VIRTUAL_ENV
              if venv then
                return { venv .. "/bin/python" }
              end
              return { "python3" }
            end,
          },
        },
        -- How the repl window will be displayed
        -- See below for more details
        repl_open_cmd = require("iron.view").split.vertical.botright(40),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually like this:
      keymaps = {
        visual_send = "<leader>is",
        send_file = "<leader>if",
        send_line = "<leader>il",
        send_paragraph = "<leader>ip",
        send_until_cursor = "<leader>iu",
        send_mark = "<leader>im",
        mark_motion = "<leader>ik",
        mark_visual = "<leader>iv",
        remove_mark = "<leader>id",
        cr = "<leader>i<cr>",
        interrupt = "<leader>ii",
        exit = "<leader>iq",
        clear = "<leader>ic",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- Custom keymaps
    vim.keymap.set("n", "<leader>it", "<cmd>IronRepl<cr>", { desc = "Iron Repl Toggle" })
    vim.keymap.set("n", "<leader>ir", "<cmd>IronRestart<cr>", { desc = "Iron Repl Restart" })
    vim.keymap.set("n", "<leader>iF", "<cmd>IronFocus<cr>", { desc = "Iron Repl Focus" })
    vim.keymap.set("n", "<leader>ih", "<cmd>IronHide<cr>", { desc = "Iron Repl Hide" })
  end,
}
