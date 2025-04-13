return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				-- ensure_installed = { "black", "stylua", "flake8" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- ensure_installed = { "lua_ls", "clangd", "ruff", "basedpyright", },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local on_attach = function(client, bufnr) end
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})

			lspconfig.clangd.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--background-index",
					"-j=12",
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "ino" },
			})

			lspconfig.nixd.setup({
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						options = {
							nixos = {
								expr = '(builtins.getFlake "~/nix-config/").nixosConfigurations.valinor.options',
							},
							home_manager = {
								expr = '(builtins.getFlake "~/nix-config").homeConfigurations."ironlung@valinor".options',
							},
						},
					},
				},
			})

			lspconfig.basedpyright.setup({
				settings = {
					basedpyright = {
						diagnosticSeverityOverrides = {
							reportUnknownMemberType = "none",
							reportUninitializedInstanceVariable = "none",
						},
					},
				},
			})

			lspconfig.ruff.setup({})
			lspconfig.ts_ls.setup({})

			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

			-- Jump to previous error
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		end,
		keys = {
			{ "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <cr>", desc = "Code Actions" },
			{ "<leader>ld", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "Definition" },
			{ "<leader>lf", "<cmd> lua require('conform').format()  <cr>", desc = "Format" },
			{ "<leader>li", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "Implementation" },
			{ "<leader>lk", "<cmd> lua vim.lsp.buf.hover() <cr>", desc = "Hover" },
			{ "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <cr>", desc = "Rename Symbol" },
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>lT",
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
	},
}
