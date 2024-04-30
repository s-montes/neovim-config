-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
return {
  settings = {
    Lua = {
      -- Get the language server to recognize the `vim` global
      diagnostics = {
        globals = { "vim" },
      },
      hint = { enable = true },
      telemetry = { enable = false },
    },
  },
}
