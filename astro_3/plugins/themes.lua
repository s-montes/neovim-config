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
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { shorten = { len = 3, exclude = { 1, -1 } } },
        layout_config = {
          horizontal = {
            preview_width = 0.6,
          },
        },
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require "alpha.themes.dashboard"
      local pwd = vim.fn.getcwd()
      local home = os.getenv "HOME" .. "/"
      pwd = pwd:gsub(home, "")
      -- https://github.com/MaximilianLloyd/ascii.nvim
      dashboard.section.header.val = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        "",
        string.format("    %s", pwd),
      }
      local button = require("astronvim.utils").alpha_button
      dashboard.section.buttons.val = {
        button("LDR n", "  New File  "),
        button("LDR f f", "  Find File  "),
        button("LDR f o", "  Recents  "),
        button("LDR S f", "  Find Session  "),
      }
      return dashboard
    end,
  },
}
