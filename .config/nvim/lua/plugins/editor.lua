return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
  {
    "mbbill/undotree",
    lazy = true,
    cmd = "UndotreeToggle",
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        main = {
          file = false,
          current = true,
        },
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          grep_word = { hidden = true },
        },
      },
    },
  },
}
