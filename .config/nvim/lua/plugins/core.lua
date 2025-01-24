return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      --require("onedark").setup({ style = "darker" })
      --require("onedark").load()
      require("tokyonight").setup({ style = "day" })
      require("tokyonight").load()
    end,
  },
}
