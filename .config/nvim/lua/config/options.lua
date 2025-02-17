-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local g = vim.g
local o = vim.o
local opt = vim.opt

g.autoformat = false

g.python_recommended_style = 0
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.expandtab = true

opts = {
  scroll = { enabled = false },
}
