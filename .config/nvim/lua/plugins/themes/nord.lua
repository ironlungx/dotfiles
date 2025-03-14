return {
  "shaunsingh/nord.nvim",

  config = function()
    vim.g.nord_contrast = false
    vim.cmd.colorscheme("nord")

    require("lualine").setup({
      options = {
        theme = "nord",
      },
    })
  end,
}
