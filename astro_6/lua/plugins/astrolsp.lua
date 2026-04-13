---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "lua",
          "python",
          "json",
        },
        ignore_filetypes = {},
      },
      disabled = {
        "lua_ls",
        "pylsp",
      },
      timeout_ms = 1000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              jedi = {
                extra_paths = { "../src" },
              },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              flake8 = { enabled = false },
              black = { enabled = false },
              ruff = { enabled = false },
              pycodestyle = { enabled = false },
            },
          },
        },
      },
      ruff = {
        init_options = {
          settings = {
            lint = {
              select = { "E", "F", "C", "I", "ARG", "PD", "B", "ICN", "PT", "SIM", "UP", "NPY", "D" },
              ignore = {
                "E501", "C901", "PT011", "PT012", "PT023", "B006",
                "PD901", "PD010",
                "D100", "D101", "D102", "D103", "D104", "D105", "D106", "D107",
                "D205", "D400", "D415",
              },
            },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "off",
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            hint = { enable = true },
            telemetry = { enable = false },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
              usePlaceholders = true,
            },
          },
        },
      },
    },
    handlers = {},
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.enable(true, { bufnr = args.buf }) end
          end,
        },
      },
    },
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client:supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    on_attach = function(client, _)
      if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
    end,
  },
}
