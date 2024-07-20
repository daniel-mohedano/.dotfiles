local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-lua/plenary.nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        --"j-hui/fidget.nvim",
        --'hrsh7th/cmp-nvim-lsp-signature-help',
    },
}

local ensured_servers = {
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "pyright",
    "julials",
    "fortls",
    "texlab",
}

function M.config()
    --require("fidget").setup({})
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
    )

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = ensured_servers,
        automatic_installation = true,
        handlers = {
            function (server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,
           ["lua_ls"] = function ()
               local lspconfig = require("lspconfig")
               lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                   settings = {
                       Lua = {
                           diagnostics = {
                               globals = { "vim" }
                           }
                       }
                   }
               }
           end,
        },
    })

    cmp.setup({
        preselect = cmp.PreselectMode.None,
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-N>"] = cmp.mapping.select_next_item(),
            ["<C-P>"] = cmp.mapping.select_prev_item(),
            ["<TAB>"] = cmp.mapping.select_next_item(),
            ["<S-TAB>"] = cmp.mapping.select_prev_item(),
            ["<C-Y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
              { name = 'buffer' },
        })
    })

    cmp.setup.cmdline({"/", "?"}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
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
