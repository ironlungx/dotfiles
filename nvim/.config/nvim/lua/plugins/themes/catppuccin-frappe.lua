return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			term_colors = true,
		})
		vim.cmd.colorscheme("catppuccin-frappe")
		require("lualine").setup({
			options = {
				theme = "catppuccin",
        -- section_separators = { left = '', right = '' },
			},
		})
	end,
}
