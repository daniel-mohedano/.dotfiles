return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          cmd = {
            "julia",
            "--project=.",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            [[
                    using LanguageServer, SymbolServer;
                    server = LanguageServer.LanguageServerInstance(stdin, stdout, Base.ARGS[1], "");
                    server.runlinter = true;
                    run(server);
            ]],
          },
          settings = { julia = { format = { indent = 2 } } },
        },
        fortls = {
          settings = {
            fortls = {
              enableCodeActions = true,
              hoverSignature = true,
              provideHover = true,
              useSignatureHelp = true,
              maxLineLength = 120,
              variableHover = true,
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
              },
              ["ui.codelenses"] = {
                test = true,
                generate = true,
              },
              ["ui.diagnostic.staticcheck"] = true,
            },
          },
        },
      },
    },
  },
}
