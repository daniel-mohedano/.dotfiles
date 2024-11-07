local ensured_servers = {
	"lua_ls",
	"stylua",
}

local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-lua/plenary.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
}

function M.config()
	--require("fidget").setup({})
	local cmp = require("cmp")
	local cmp_lsp = require("cmp_nvim_lsp")
	local capabilities =
		vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

	require("mason").setup()
	require("mason-tool-installer").setup({
		ensure_installed = ensured_servers,
	})
	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				local lspconfig = require("lspconfig")
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,
		},
	})

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		--preselect = cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<S-CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	vim.diagnostic.config({
		virtual_text = true,
		udpate_in_insert = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

return M
