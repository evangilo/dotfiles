#!/bin/bash

function install {
  brew install emacs
}

function setup {
  ln -sf $DOTFILES/emacs/emacs ~/.emacs
}

install
setup
