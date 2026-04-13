local fix_style_tk = function()
  vim.api.nvim_set_hl(0, "tkTag", { bold = true, fg = "#94E2D5" })
  vim.api.nvim_set_hl(0, "tkHighlight", { bold = true, fg = "#EBA0AC" })
  vim.api.nvim_set_hl(0, "tkLink", { underline = true, bold = true, fg = "#FAB387" })
  vim.api.nvim_set_hl(0, "tkAliasedLink", { underline = true, bold = true, fg = "#B4BEFE" })
  vim.api.nvim_set_hl(0, "tkHighlightedAliasedLink", { underline = true, bold = true, fg = "#EBA0AC" })
  vim.api.nvim_set_hl(0, "tkLinkAlias", { underline = true, bold = true, fg = "#B4BEFE" })
  vim.api.nvim_set_hl(0, "tkLinkBody", { underline = true, bold = true, fg = "#FAB387" })
end

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local pwd = vim.fn.getcwd()
      local home = os.getenv "HOME" .. "/"
      pwd = pwd:gsub(home, "")
      opts.dashboard.preset.header = table.concat({
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        "",
        string.format("    %s", pwd),
      }, "\n")
      return opts
    end,
  },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
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
    "kylechui/nvim-surround",
    lazy = false,
    version = "*",
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
        },
      }
    end,
    version = "*",
  },
  {
    "nvim-telekasten/telekasten.nvim",
    cmd = "Telekasten",
    dependencies = { "nvim-telekasten/calendar-vim", "nvim-telescope/telescope.nvim" },
    init = fix_style_tk,
    keys = {
      { "<leader>zz", "<cmd>Telekasten panel<cr>", desc = ":tk Toggle panel" },
      { "<leader>zf", "<cmd>Telekasten find_notes<cr>", desc = ":tk Find notes" },
      { "<leader>zs", "<cmd>Telekasten search_notes<cr>", desc = ":tk Search notes" },
      { "<leader>zt", "<cmd>Telekasten goto_today<cr>", desc = ":tk Open today's note" },
      { "<leader>zn", "<cmd>Telekasten new_note<cr>", desc = ":tk Create new note" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<cr>", desc = ":tk Open calendar" },
      { "<leader>zi", "<cmd>Telekasten insert_link<cr>", desc = ":tk Insert link" },
      { "<leader>z[", "<cmd>Telekasten toggle_todo<cr>", desc = ":tk Toggle TODO" },
      { "<leader>z<cr>", "<cmd>Telekasten follow_link<cr>", desc = ":tk Follow link" },
    },
    config = function()
      local notes_workspace = vim.fn.expand(os.getenv "LOCAL_NOTES_PATH")
      require("telekasten").setup {
        home = notes_workspace,
        dailies = notes_workspace .. "daily",
        uuid_type = "rand",
        template_new_daily = notes_workspace .. "templates/daily.md",
        template_new_note = notes_workspace .. "templates/new_note.md",
      }
    end,
  },
}
