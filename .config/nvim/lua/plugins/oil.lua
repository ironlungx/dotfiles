return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    setup = function()
      require("oil").setup()
    end,
  },
}
