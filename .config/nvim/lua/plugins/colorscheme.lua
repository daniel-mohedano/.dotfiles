return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = { blink_cmp = true },
    },
  },
}
