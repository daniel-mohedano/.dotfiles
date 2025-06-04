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
        formatters = {
          file = {
            filename_first = true,
            truncate = 80,
          },
        },
        layout = {
          preset = "dropdown",
        },
        main = {
          file = false,
          current = true,
        },
        sources = {
          files = { hidden = true, ignored = true },
          grep = { hidden = true },
          grep_word = { hidden = true },
        },
        win = {
          input = {
            keys = {
              ["<c-l>"] = { "toggle_preview", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<c-l>"] = "toggle_preview",
            },
          },
        },
      },
    },
  },
}
