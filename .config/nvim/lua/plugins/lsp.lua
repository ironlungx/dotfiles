return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.hls.setup({})
      lspconfig.jedi_language_server.setup {}
    end,
    keys = {
      { "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <cr>",           desc = "Code Actions" },
      { "<leader>ld", "<cmd> lua vim.lsp.buf.definition() <cr>",            desc = "Definition" },
      { "<leader>lf", "<cmd> lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },
      { "<leader>li", "<cmd> lua vim.lsp.buf.implementation() <cr>",        desc = "Implementation" },
      { "<leader>lk", "<cmd> lua vim.lsp.buf.hover() <cr>",                 desc = "Hover" },
      { "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <cr>",                desc = "Rename Symbol" },
    }
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>lt",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>ls",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>lQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
