-----------------------------------------------------------------------------------
-- CONFIG DICT
-----------------------------------------------------------------------------------
vim.g.maplocalleader = ","

local fix_style_tk = function()
  vim.api.nvim_set_hl(0, "tkTag", { bold = true, fg = "yellow", ctermbg = 0, bg = "black" })
  vim.api.nvim_set_hl(0, "tkHighlight", { bold = true, fg = "IndianRed", ctermbg = 0, bg = "black" })
  vim.api.nvim_set_hl(0, "tkLink", { underline = true, bold = true, fg = "SandyBrown" })
  vim.api.nvim_set_hl(0, "tkLinkAlias", { underline = true, bold = true, fg = "SandyBrown" })
  vim.api.nvim_set_hl(0, "tkHighlightedAliasedLink", { underline = true, bold = true, fg = "MediumSlateBlue" })
end

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

local config = {
  -- Theme
  -- colorscheme = "nordfox",
  -- colorscheme = "nightfox",
  -- colorscheme = "duskfox",
  colorscheme = "catppuccin",
  ---------------------------------------------------------------------------------
  -- Key mappings
  mappings = {
    -- first key is the mode
    n = {
      ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
      ["<leader>p"] = { '"+p', desc = "Paste from clipboard" },
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      -- quick save
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
      ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle term" },
      -- ipython
      ["<leader>tp"] = {
        function() astronvim.toggle_term_cmd "ipython" end,
        desc = "ToggleTerm ipython",
      },
      -- Testing
      ["<leader>Dt"] = { '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle test summary" },
      ["<leader>Dd"] = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = "Debug test" },
      ["<leader>Ds"] = { '<cmd>lua require("neotest").output_panel.open()<cr>', desc = "Toggle test output panel" },
      ["<leader>D<cr>"] = { '<cmd>lua require("neotest").output.open({enter = true})<cr>', desc = "Open test result" },
      -- Python docstring
      ['<leader>l"'] = {
        ":lua require('neogen').generate()<CR>",
        noremap = true,
        silent = true,
        desc = "Generate docstring",
      },
      -- Telekasten
      ["<leader>zz"] = { "<cmd>Telekasten panel<cr>", desc = ":tk Toggle panel" },
      ["<leader>zf"] = { "<cmd>Telekasten find_notes<cr>", desc = ":tk Find notes" },
      ["<leader>zs"] = { "<cmd>Telekasten search_notes<cr>", desc = ":tk Search notes" },
      ["<leader>zt"] = { "<cmd>Telekasten goto_today<cr>", desc = ":tk Open today's note" },
      ["<leader>zn"] = { "<cmd>Telekasten new_note<cr>", desc = ":tk Create new note" },
      ["<leader>zc"] = { "<cmd>Telekasten show_calendar<cr>", desc = ":tk Open calendar" },
      ["<leader>zi"] = { "<cmd>Telekasten insert_link<cr>", desc = ":tk Insert link" },
      ["<leader>z["] = { "<cmd>Telekasten toggle_todo<cr>", desc = ":tk Toggle TODO" },
      ["<leader>z<cr>"] = { "<cmd>Telekasten follow_link<cr>", desc = ":tk Follow link" },
      ["<leader>zw"] = { ":set wrap linebreak<cr>", desc = "Fix soft wrap" },
      ["<leader>zp"] = { fix_style_tk, desc = ":tk Prettify format" },
    },
    v = {
      -- -- Other utils
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["z"] = { name = "Telekasten" },
          ["<leader>"] = { name = "Other utils" },
        },
      },
    },
  },
  ----------------------------------------------------------------------------------
  --Plugins
  plugins = {
    init = {
      {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("todo-comments").setup {
            -- keywords = {
            --         H_T = { color = "warning" },
            --         M_T = { color = "hint" },
            --         L_T = { color = "test" },
            -- }
          }
        end,
      },
      {
        "renerocksai/telekasten.nvim",
        config = function()
          local notes_workspace = "/Users/smontes/Documents/Notes/new_vault/"
          require("telekasten").setup {
            home = notes_workspace,
            uuid = "rand",
            template_new_daily = notes_workspace .. "templates/daily.md",
            template_new_note = notes_workspace .. "templates/new_note.md",
          }
        end,
      },
      {
        "renerocksai/calendar-vim",
      },
      {
        "nvim-neotest/neotest-python",
      },
      {
        "nvim-neotest/neotest",
        requires = {},
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
        tag = "*",
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
        tag = "*",
      },
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup {
            styles = {
              conditionals = {},
            },
          }
        end,
      },
      {
        "EdenEast/nightfox.nvim",
      },
    },
    indent_blankline = {
      enabled = false,
      colored_indent_levels = false,
      char = "",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      show_trailing_blankline_indent = false,
    },
  },
  ----------------------------------------------------------------------------------
  -- Linters and formatters
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.markdownlint.with { filetypes = { "markdown", "telekasten" } },
      null_ls.builtins.formatting.markdownlint.with { filetypes = { "markdown", "telekasten" } },
    }
    config.debug = true
    return config -- return final config table to use in require("null-ls").setup(config)
  end,
  ----------------------------------------------------------------------------------
  -- LSP stuff
  lsp = {
    formatting = {
      disabled = {
        "sumneko_lua",
      },
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "lua",
          "python",
        },
      },
    },
    servers = {
      "pylsp",
      "sumneko_lua",
    },
    -- on_attach = on_attach,
    ["server-settings"] = {
      pylsp = {
        plugins = {
          jedi = {
            extra_paths = { "../src" },
          },
          autopep8 = {
            enabled = false,
          },
          yapf = {
            enabled = false,
          },
          mccabe = {
            enabled = false,
          },
          pyflakes = {
            enabled = false,
          },
          flake8 = {
            enabled = false,
          },
          black = {
            enabled = true,
          },
          ruff = {
            enabled = true,
            select = { "E", "F", "C", "ARG", "PD" },
            ignore = { "E501" },
          },
          pycodestyle = {
            enabled = false,
          },
        },
      },
      sumneko_lua = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
          format = {
            enable = false,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
            },
          },
        },
      },
    },
  },
}
return config
