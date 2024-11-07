local M = { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
}

function M.config()
	require("gitsigns").setup({
		signcolumn = true,
		auto_attach = true,
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	})
	vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, { desc = "[G]it [B]lame" })
end

return M
