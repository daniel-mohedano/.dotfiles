-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "kj", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })
map("x", "p", '"_dP', { desc = "Hold onto yanked content when pasting in visual mode" })

if not vim.g.vscode then
  -- regular neovim keymaps
  map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
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

  map("n", "<leader>/", function()
    require("telescope.builtin").live_grep({ additional_args = { "--hidden" } })
  end, { desc = "Telescope - Grep String" })

  map("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Project view with oil" })
else
  -- vscode keymaps
  map("n", "<leader>q", function()
    require("vscode").action("workbench.action.closeActiveEditor")
  end, { desc = "vscode close active editor" })

  map("n", "<leader><space>", function()
    require("vscode").action("workbench.action.quickOpen")
  end, { desc = "vscode find file" })
  map("n", "<leader>/", function()
    require("vscode").action("workbench.action.findInFiles")
  end, { desc = "vscode find in files" })

  map("n", "<leader>gs", function()
    require("vscode").action("workbench.view.scm")
  end, { desc = "source code view" })

  map("n", "<leader>pv", function()
    require("vscode").action("workbench.view.explorer")
  end, { desc = "project view" })
end
