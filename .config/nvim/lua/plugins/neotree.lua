return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	--  opts =
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					--visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						".github",
						".gitignore",
						"package-lock.json",
					},
					never_show = { ".git" },
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree <CR>")
		vim.keymap.set("n", "<leader>E", ":Neotree toggle <CR>")
	end,
}
