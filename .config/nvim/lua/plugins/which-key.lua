return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,

  config = function ()
    local wk = require("which-key")

    -- Define all keybinds
    wk.register {
      -- LSP
      ["<leader>l"] = {
        name = "lsp",

        ['d'] = {"<cmd> lua vim.lsp.buf.definition() <cr>", "goto symbol definition"},
        ['k'] = {"<cmd> lua vim.lsp.buf.hover() <cr>", "show hover"},
        ['i'] = {"<cmd> lua vim.lsp.buf.implementation() <cr>", "goto implementation"},

        ['r'] = {"<cmd> lua vim.lsp.buf.rename() <cr>", "rename symbol"},
        ['a'] = {"<cmd> lua vim.lsp.buf.code_action() <cr>", "code actions"},
        ["f"] = {"<cmd> lua vim.lsp.buf.format { async = true } <cr>", "Format" }
      },

      -- NEOTREE
      ["<leader>e"] = { "<cmd> Neotree toggle <cr>", "Toggle NeoTree"},
      ["<leader>n"] = { "<cmd> Neotree <cr>", "Focus Neotree" },

      -- TELESCOPE
      ["<leader>f"] = {
        name = "telescope",

        ['f'] = { "<cmd> lua require(\"telescope.builtin\").find_files() <cr>", "Files"},
        ['g'] = { "<cmd> lua require(\"telescope.builtin\").live_grep() <cr>", "Live Grep"},
        ['b'] = { "<cmd> lua require(\"telescope.builtin\").buffers() <cr>", "Buffers"},
        ['o'] = { "<cmd> lua require(\"telescope.builtin\").oldfiles() <cr>", "Old Files"},

      },

      ["<C-h>"] = { "<C-W>h", "Right Window"},
      ["<C-j>"] = { "<C-W>j", "Lower Window"},
      ["<C-k>"] = { "<C-W>k", "Upper Window"},
      ["<C-l>"] = { "<C-W>l", "Left Window"},
    }
  end
}
