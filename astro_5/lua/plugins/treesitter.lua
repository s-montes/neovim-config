-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "python", "yaml", "toml", "markdown", "json", "lua" },
  },
}
