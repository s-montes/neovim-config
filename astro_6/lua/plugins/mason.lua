---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "python-lsp-server",
        "pyright",
        "gopls",
        "ruff",
        "prettier",
        "stylua",
        "markdownlint",
        "debugpy",
        "tree-sitter-cli",
      },
    },
  },
}
