#!/bin/bash

set -eou pipefail

source ~/.local/share/nvim/mason/packages/python-lsp-server/venv/bin/activate

python -m pip install pylsp-rope
