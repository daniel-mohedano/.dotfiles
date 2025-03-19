-- vscode basic configuration

vim.g.mapleader = " "

vim.opt.expandtab = false -- use tabs instead of spaces
vim.opt.shiftwidth = 4 -- size of indent
--vim.opt.hlsearch = true
--vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

local map = vim.keymap.set

-- map("i", "kj", "<esc>", { desc = "Exit insert mode" })
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })
-- map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("x", "p", '"_dP', { desc = "Hold onto yanked content when pasting in visual mode" })

