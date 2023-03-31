-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp
return {
  settings = {
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
          enabled = false,
        },
        ruff = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
        mypy = {
          enable = true,
        },
      },
    },
  },
}
