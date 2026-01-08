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
            -- Removed bracketed_paste format as it was causing Lua errors.
            -- Relying on ipython --no-autoindent for correct multi-line handling.
            command = function()
              local venv = vim.env.VIRTUAL_ENV
              if venv then
                -- Check for ipython in venv
                if vim.fn.executable(venv .. "/bin/ipython") == 1 then
                  return { venv .. "/bin/ipython", "--no-autoindent" }
                end
                return { venv .. "/bin/python" }
              end
              
              if vim.fn.executable("ipython") == 1 then
                return { "ipython", "--no-autoindent" }
              end
              return { "python3" }
            end,
          },
          r = {
            command = function()
              if vim.fn.executable("radian") == 1 then
                return { "radian" }
              end
              return { "R" }
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
        send_file = "<leader>iF", -- Changed from if to iF to free up if for function
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
    vim.keymap.set("n", "<leader>iR", "<cmd>IronFocus<cr>", { desc = "Iron Repl Focus" }) -- Renamed to iR to match common patterns
    vim.keymap.set("n", "<leader>ih", "<cmd>IronHide<cr>", { desc = "Iron Repl Hide" })

    -- Custom "Send Function" using Treesitter
    vim.keymap.set("n", "<leader>if", function()
      local ts_utils = require("nvim-treesitter.ts_utils")
      local node = ts_utils.get_node_at_cursor()
      
      if not node then return end

      -- Walk up the tree to find a function definition
      while node do
        if node:type() == "function_definition" or node:type() == "method_definition" then
          break
        end
        node = node:parent()
      end

      if not node then
        vim.notify("No function found under cursor", vim.log.levels.WARN)
        return
      end

      -- Select the function node
      ts_utils.update_selection(0, node)
      
      -- Send the visual selection to Iron
      require("iron.core").visual_send()
      
      -- Clear selection (optional, but nice)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    end, { desc = "Iron Send Function" })

  end,
}
