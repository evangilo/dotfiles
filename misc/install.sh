#!/bin/bash

function install {
  brew install fzf ripgrep ncdu xsel
}

function setup {
  ln -sf $DOTFILES/misc/colorssh.sh ~/.colorssh.sh
}

install
setup
