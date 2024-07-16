return {
	"folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons"
  },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,

  config = function ()
    local wk = require("which-key")

    -- -- Define all keybinds
    -- wk.register {
    --   -- LSP
    --   ["<leader>l"] = {
    --     name = "lsp",
    --
    --     ['d'] = {"<cmd> lua vim.lsp.buf.definition() <cr>", "goto symbol definition"},
    --     ['k'] = {"<cmd> lua vim.lsp.buf.hover() <cr>", "show hover"},
    --     ['i'] = {"<cmd> lua vim.lsp.buf.implementation() <cr>", "goto implementation"},
    --
    --     ['r'] = {"<cmd> lua vim.lsp.buf.rename() <cr>", "rename symbol"},
    --     ['a'] = {"<cmd> lua vim.lsp.buf.code_action() <cr>", "code actions"},
    --     ["f"] = {"<cmd> lua vim.lsp.buf.format { async = true } <cr>", "Format" }
    --   },
    --
    --   -- NEOTREE
    --   ["<leader>e"] = { "<cmd> Neotree toggle <cr>", "Toggle NeoTree"},
    --   ["<leader>n"] = { "<cmd> Neotree <cr>", "Focus Neotree" },
    --
    --   -- TELESCOPE
    --   ["<leader>f"] = {
    --     name = "telescope",
    --
    --     ['f'] = { "<cmd> lua require(\"telescope.builtin\").find_files() <cr>", "Files"},
    --     ['g'] = { "<cmd> lua require(\"telescope.builtin\").live_grep() <cr>", "Live Grep"},
    --     ['b'] = { "<cmd> lua require(\"telescope.builtin\").buffers() <cr>", "Buffers"},
    --     ['o'] = { "<cmd> lua require(\"telescope.builtin\").oldfiles() <cr>", "Old Files"},
    --
    --   },
    --
    --   ["<C-h>"] = { "<C-W>h", "Right Window"},
    --   ["<C-j>"] = { "<C-W>j", "Lower Window"},
    --   ["<C-k>"] = { "<C-W>k", "Upper Window"},
    --   ["<C-l>"] = { "<C-W>l", "Left Window"},
    -- }

    wk.add  {
    { "<C-h>", "<C-W>h", desc = "Right Window" },
    { "<C-j>", "<C-W>j", desc = "Lower Window" },
    { "<C-k>", "<C-W>k", desc = "Upper Window" },
    { "<C-l>", "<C-W>l", desc = "Left Window" },
    { "<leader>e", "<cmd> Neotree toggle <cr>", desc = "Toggle NeoTree" },
    { "<leader>f", group = "telescope" },
    { "<leader>fb", '<cmd> lua require("telescope.builtin").buffers() <cr>', desc = "Buffers" },
    { "<leader>ff", '<cmd> lua require("telescope.builtin").find_files() <cr>', desc = "Files" },
    { "<leader>fg", '<cmd> lua require("telescope.builtin").live_grep() <cr>', desc = "Live Grep" },
    { "<leader>fo", '<cmd> lua require("telescope.builtin").oldfiles() <cr>', desc = "Old Files" },
    { "<leader>l", group = "lsp" },
    { "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <cr>", desc = "code actions" },
    { "<leader>ld", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "goto symbol definition" },
    { "<leader>lf", "<cmd> lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },
    { "<leader>li", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "goto implementation" },
    { "<leader>lk", "<cmd> lua vim.lsp.buf.hover() <cr>", desc = "show hover" },
    { "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <cr>", desc = "rename symbol" },
    { "<leader>n", "<cmd> Neotree <cr>", desc = "Focus Neotree" },
  }
  end
}
