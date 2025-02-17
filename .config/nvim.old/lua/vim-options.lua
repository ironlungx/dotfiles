vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.cmd("set relativenumber")
vim.o.guifont = "JetbrainsMono Nerd Font:h9"

padding = 10

vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_padding_top = padding + 5
vim.g.neovide_padding_bottom = padding + 5
vim.g.neovide_padding_right = padding
vim.g.neovide_padding_left = padding

vim.cmd("hi Folded guibg=NONE")

vim.g.mapleader = " "
-- vim.opt.showmode = false

vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>fs", ":w <CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Remove Highlights" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
