#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh fzf ripgrep ncdu direnv tmux
  sudo bash $DIR/fix_cedilla.sh
  sudo bash $DIR/fix_keychron_function_keys.sh
}

install
