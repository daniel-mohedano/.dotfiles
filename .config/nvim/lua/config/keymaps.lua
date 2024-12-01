-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "kj", "<esc>", { desc = "Exit insert mode" })
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("x", "p", '"_dP', { desc = "Hold onto yanked content when pasting in visual mode" })

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree - Toggle" })

map("n", "<leader>gs", "<cmd>above Git<cr>", { desc = "VimFugitive - Git" })
map("n", "<leader>p", function()
  if vim.bo.filetype == "fugitive" then
    vim.cmd.Git("push")
  end
end, { desc = "VimFugitive - Push" })
map("n", "<leader>P", function()
  if vim.bo.filetype == "fugitive" then
    vim.cmd.Git("pull --rebase")
  end
end, { desc = "VimFugitive - Pull (rebase)" })

map("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Project view with oil" })
