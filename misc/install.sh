#!/bin/bash

function install {
  brew install fzf ripgrep ncdu
}

function setup {
  ln -sf $DOTFILES/misc/colorssh.sh ~/.colorssh.sh
  ln -sf $DOTFILES/misc/rgignore ~/.rgignore
}

install
setup
