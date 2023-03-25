return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "yaml", "toml", "markdown", "json", "lua" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ruff_lsp",
        -- "pylsp",
        "pyright",
        "lua_ls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "stylua", "markdownlint" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python" },
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
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "python", "markdown", "telekasten" },
    config = function()
      require("todo-comments").setup {
        keywords = {
          HIGH_P = { color = "#FF3264" },
          MID_P = { color = "#FBBF24" },
          LOW_P = { color = "#00BEDE" },
        },
        highlight = {
          pattern = [[.*:?<(KEYWORDS)\s*:]],
          comments_only = false,
        },
      }
    end,
  },
}
