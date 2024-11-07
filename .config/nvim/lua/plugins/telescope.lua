-- Requirements: ripgrep and fzf

local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	lazy = true,
	cmd = "Telescope",
}

function M.config()
	local actions = require("telescope.actions")
	require("telescope").setup({
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
					return { "--hidden" }
				end,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("ui-select")
end

return M
