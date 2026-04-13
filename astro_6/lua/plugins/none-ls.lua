---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.markdownlint.with {
        extra_filetypes = { "telekasten" },
        extra_args = { "--disable", "MD013", "--" },
      },
      null_ls.builtins.formatting.markdownlint.with {
        extra_filetypes = { "telekasten" },
        extra_args = { "--disable", "MD013", "--" },
      },
    })
  end,
}
