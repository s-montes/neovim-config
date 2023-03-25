return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.black,
      -- null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.jq,
      null_ls.builtins.diagnostics.markdownlint.with { filetypes = { "telekasten" } },
      null_ls.builtins.formatting.markdownlint.with { filetypes = { "telekasten" } },
    }
    config.debug = true
    return config
  end,
}
