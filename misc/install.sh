#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  brew install fzf ripgrep ncdu
}

function setup {
  ln -sf $DIR/colorssh.sh ~/.colorssh.sh
  ln -sf $DIR/rgignore ~/.rgignore
}

install
setup
