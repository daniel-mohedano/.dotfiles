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
          settings = { julia = { format = { indent = 4 } } },
        },
      },
    },
  },
}
