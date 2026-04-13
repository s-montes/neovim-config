---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = { "python", "yaml", "toml", "markdown", "json", "lua" },
    },
  },
}
