-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples

local fix_style_tk = function()
  -- See https://github.com/catppuccin/nvim/tree/main/lua/catppuccin/palettes
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

  -- == Examples of Adding Plugins ==

  {
    "renerocksai/calendar-vim",
  },
  {
    "renerocksai/telekasten.nvim",
    cmd = "Telekasten",
    dependencies = { "renerocksai/calendar-vim" },
    init = fix_style_tk,
    keys = {
      ["<leader>zz"] = { "<cmd>Telekasten panel<cr>", desc = ":tk Toggle panel" },
      ["<leader>zf"] = { "<cmd>Telekasten find_notes<cr>", desc = ":tk Find notes" },
      ["<leader>zs"] = { "<cmd>Telekasten search_notes<cr>", desc = ":tk Search notes" },
      ["<leader>zt"] = { "<cmd>Telekasten goto_today<cr>", desc = ":tk Open today's note" },
      ["<leader>zn"] = { "<cmd>Telekasten new_note<cr>", desc = ":tk Create new note" },
      ["<leader>zc"] = { "<cmd>Telekasten show_calendar<cr>", desc = ":tk Open calendar" },
      ["<leader>zi"] = { "<cmd>Telekasten insert_link<cr>", desc = ":tk Insert link" },
      ["<leader>z["] = { "<cmd>Telekasten toggle_todo<cr>", desc = ":tk Toggle TODO" },
      ["<leader>z<cr>"] = { "<cmd>Telekasten follow_link<cr>", desc = ":tk Follow link" },
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
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-python" },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
          },
        },
      }
    end,
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
    -- Uncomment next line if you want to follow only stable versions
    version = "*",
  },
  {
    "folke/todo-comments.nvim",
    cmd = "TodoTelescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "python", "markdown", "telekasten" },
    config = function()
      require("todo-comments").setup {
        keywords = {
          NOTE = { icon = " ", color = "hint", alt = {} },
          HIGH_P = { icon = " ", color = "#FF3264" },
          MID_P = { icon = " ", color = "#FBBF24" },
          LOW_P = { icon = " ", color = "#00BEDE" },
        },
        highlight = {
          pattern = [[.*[^.]:?<(KEYWORDS)\s*:?]],
          comments_only = false,
        },
        search = {
          pattern = [[\b(KEYWORDS)\b]],
        },
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
    },
  },
  -- == Examples of Overriding Plugins ==

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
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local pwd = vim.fn.getcwd()
      local home = os.getenv "HOME" .. "/"
      pwd = pwd:gsub(home, "")
      -- customize the dashboard header
      opts.section.header.val = {
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
      return opts
    end,
  },
}
