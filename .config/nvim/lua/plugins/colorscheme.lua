local M = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("onedark").setup({
		style = "darker",
	})
	require("onedark").load()
end

return M
