local M = {}

local theme_path = vim.fn.expand("~/.theme-current")

function M.current()
  local ok, lines = pcall(vim.fn.readfile, theme_path)
  if not ok or #lines == 0 then
    return "light"
  end
  local mode = (lines[1] or ""):gsub("%s+", ""):lower()
  return (mode == "dark") and "dark" or "light"
end

function M.apply()
  if M.current() == "light" then
    vim.o.background = "light"
    vim.cmd.colorscheme("catppuccin-latte")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight")
  end
end

return M
