return {
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
          H_T = { color = "#DC2626" },
          M_T = { color = "#FBBF24" },
          L_T = { color = "#7C3AED" },
        },
        highlight = {
          pattern = [[.*:?<(KEYWORDS)\s*:]],
          comments_only = false,
        },
      }
    end,
  },
}
