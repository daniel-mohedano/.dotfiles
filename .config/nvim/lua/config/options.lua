-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "

vim.opt.expandtab = false -- use tabs instead of spaces
vim.opt.shiftwidth = 4 -- size of indent
--vim.opt.hlsearch = true
--vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.g.lazyvim_picker = "telescope"
