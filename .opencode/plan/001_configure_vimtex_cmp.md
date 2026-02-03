# Plan: Configure VimTeX Autocompletion

## Objective
Enable automatic citation completion in Neovim when typing `\cite{` in LaTeX files.

## Proposed Changes

### 1. Modify `configs/nvim/lua/plugins/cmp.lua`
We need to register the `cmp-vimtex` source with the completion engine.

**File:** `configs/nvim/lua/plugins/cmp.lua`

**Changes:**
1.  **Add Dependency:**
    Add `"micangl/cmp-vimtex"` to the dependencies list of `nvim-cmp`.
    
    ```lua
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "micangl/cmp-vimtex", -- Add this
      "L3MON4D3/LuaSnip",
    },
    ```

2.  **Add Source:**
    Add the `vimtex` source to the `sources` configuration.
    
    ```lua
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vimtex" }, -- Add this
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
    ```

## Verification
1.  Open a `.tex` file.
2.  Type `\cite{`.
3.  Verify that a popup menu appears with citation keys from the bibliography.
