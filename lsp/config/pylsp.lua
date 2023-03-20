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
          enabled = true,
        },
        ruff = {
          enabled = false,
          select = { "E", "F", "C", "ARG", "PD" },
          ignore = { "E501" },
        },
        pycodestyle = {
          enabled = false,
        },
      },
    },
  },
}
