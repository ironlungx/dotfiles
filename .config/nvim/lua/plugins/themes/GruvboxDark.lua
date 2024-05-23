return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd("colorscheme gruvbox")

    require("gruvbox").setup({
      terminal_colors = true,
    })
  end,
}
