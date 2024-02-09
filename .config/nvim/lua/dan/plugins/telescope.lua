-- Requirements: ripgrep

local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    lazy = true,
    cmd = "Telescope"
}

function M.config()
    local actions = require("telescope.actions")
    require("telescope").setup {
        defaults = {
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    ["<C-q>"] = actions.close,
                },
                n = {
                    ["q"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                },
            },
        },
        pickers = {
            find_files = { hidden = true, no_ignore = true, follow = true },
            live_grep = {
                additional_args = function(opts)
                    return {"--hidden"}
                end
            }
        },
    }
end

return M
