return {
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "rcarriga/cmp-dap",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.window = {
        completion = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
          winhighlight = "Normal:Pmenu",
        }),
        documentation = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
          winhighlight = "Normal:Pmenu",
        }),
      }

      cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = { { name = "dap" } },
      })

      cmp.setup.cmdline("/", {
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
    end,
  },
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = false, terminal = false },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = "Git",
  },
}
