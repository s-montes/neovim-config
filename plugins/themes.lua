return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    opts = {
      colored_indent_levels = false,
      show_trailing_blankline_indent = false,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      styles = {
        conditionals = {},
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require "alpha.themes.dashboard"
      local pwd = vim.fn.getcwd()
      local home = os.getenv "HOME" .. "/"
      pwd = pwd:gsub(home, "")
      dashboard.section.header.val = {
        "    ███    ██ ███████ ███████ ██    ██ ██ ███    ███",
        "    ████   ██ ██      ██   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ███████ ██   ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██ ██      ██   ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████ ███████ ███████   ████   ██ ██      ██",
        "",
        "",
        string.format("    %s", pwd),
      }
      local button = require("astronvim.utils").alpha_button
      dashboard.section.buttons.val = {
        button("LDR n", "  New File  "),
        button("LDR f f", "  Find File  "),
        button("LDR f o", "  Recents  "),
        button("LDR f w", "  Find Word  "),
        button("LDR f '", "  Bookmarks  "),
        button("LDR S f", "  Find Session  "),
      }
      return dashboard
    end,
  },
}
