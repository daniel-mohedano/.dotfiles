local M = {
    "kepano/flexoki-neovim",
    name = "flexoki",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.cmd("colorscheme flexoki-dark")
end

return M
