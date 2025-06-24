return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      require("util.theme").apply()
    end,
  },
}
