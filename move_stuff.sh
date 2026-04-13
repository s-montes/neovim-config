#!/bin/bash

set -e

if [[ "$1" == "repo2config" ]]; then
  echo "Moving stuff from repo to configuration folder..."
  cp -r ./astro_6/* ~/.config/nvim/
  echo "Done!"
elif [[ "$1" == "config2repo" ]]; then
  echo "Moving stuff from configuration folder to repo..."
  cp -r ~/.config/nvim/* ./astro_6/
  echo "Done!"
else
  echo "Use repo2config or config2repo!"
fi

