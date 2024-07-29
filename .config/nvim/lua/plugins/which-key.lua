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

  config = function()
    local wk = require("which-key")

    wk.add {
      { "<C-h>",      "<C-W>h",                                                   desc = "Right Window" },
      { "<C-j>",      "<C-W>j",                                                   desc = "Lower Window" },
      { "<C-k>",      "<C-W>k",                                                   desc = "Upper Window" },
      { "<C-l>",      "<C-W>l",                                                   desc = "Left Window" },
      { "<leader>l",  group = "lsp" },
      { "<leader>f",  group = "telescope" },
    }
  end
}
