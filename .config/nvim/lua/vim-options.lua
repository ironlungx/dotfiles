vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.cmd("set guifont=JetbrainsMono\\ Nerd\\ Font:h11")

vim.cmd("hi Folded guibg=NONE")
vim.cmd("set cmdheight=2")

vim.g.mapleader = " "
vim.opt.showmode = false

vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>fs", ":w <CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Remove Highlights" })
