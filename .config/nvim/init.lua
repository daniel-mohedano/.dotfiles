-- set default condition for plugins before loading lazy
if vim.g.vscode then
  require("config.vscode").load()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set theme
local theme = require("util.theme")
vim.api.nvim_create_user_command("ThemeReload", theme.apply, {})
