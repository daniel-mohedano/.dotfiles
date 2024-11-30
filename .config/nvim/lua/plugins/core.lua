return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      require("onedark").setup({ style = "darker" })
      require("onedark").load()
    end,
  },
}
