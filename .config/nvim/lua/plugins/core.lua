return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      require("tokyonight").setup({ style = "night" })
      require("tokyonight").load()
    end,
  },
}
