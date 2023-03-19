return {
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
  config = {
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
}
