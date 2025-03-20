-- disable all plugins by default in vscode
local M = {}

function M.load()
    vim.g.lazy_default_cond = function()
        return not vim.g.vscode
    end
end

return M