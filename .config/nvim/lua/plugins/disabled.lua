local disabled_plugins = {
  "akinsho/bufferline.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "nvimdev/dashboard-nvim",
  "folke/persistence.nvim",
}

local config = {}
for _, p in ipairs(disabled_plugins) do
  table.insert(config, { p, enabled = false })
end

return config
