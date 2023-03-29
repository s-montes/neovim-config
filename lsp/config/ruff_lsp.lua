-- See https://github.com/charliermarsh/ruff-lsp
return {
  init_options = {
    settings = {
      args = {
        "--select",
        "E",
        "--select",
        "F",
        "--select",
        "C",
        "--select",
        "I",
        "--select",
        "ARG",
        "--select",
        "PD",
        "--ignore",
        "E501",
        "--ignore",
        "PD901",
      },
    },
  },
}
