return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- default cmdline sources
        cmdline = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
      },
      completion = { list = { selection = { preselect = false, auto_insert = true } } },
      keymap = { preset = "default" },
    },
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = false, terminal = false },
    },
    cond = true, -- explicitly enable in vscode
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = "Git",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "julia",
      },
    },
    cond = true, -- explicitly enable in vscode
  },
  {
    "folke/flash.nvim",
    cond = true, -- explicitly enable in vscode
  },
}
