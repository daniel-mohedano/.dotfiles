return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      --require("onedark").setup({ style = "darker" })
      --require("onedark").load()
      --require("tokyonight").setup({ style = "day", day_brightness = 0.4 })
      --require("tokyonight").load()
      require("catppuccin").setup({ flavour = "latte" })
      require("catppuccin").load()
    end,
  },
}
