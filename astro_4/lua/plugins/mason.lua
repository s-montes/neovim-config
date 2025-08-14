-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "ruff",
        "pylsp",
        "gopls",
        -- add more arguments for adding more language servers
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {
        "prettier",
        "stylua",
        "markdownlint",
      }
      opts.handlers.prettier = function()
        require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
              or utils.root_has_file ".prettierrc"
              or utils.root_has_file ".prettierrc.json"
              or utils.root_has_file ".prettierrc.js"
          end,
        })
      end
      opts.handlers.markdownlint = function()
        require("null-ls").register(require("null-ls").builtins.formatting.markdownlint.with {
          extra_filetypes = { "telekasten" },
          -- extra_args = { "--disable", "MD013", "--" },
        })
      end
    end,
  },
  -- {
  --     "jay-babu/mason-null-ls.nvim",
  --     -- overrides `require("mason-null-ls").setup(...)`
  --     opts = function(_, opts)
  --         -- add more things to the ensure_installed table protecting against community packs modifying it
  --         opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
  --             "prettier",
  --             "stylua",
  --             "markdownlint",
  --             -- add more arguments for adding more null-ls sources
  --         })
  --     end,
  -- },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
