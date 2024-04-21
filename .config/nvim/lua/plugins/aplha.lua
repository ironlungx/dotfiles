return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
    theme = require("alpha.themes.theta").config
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}
