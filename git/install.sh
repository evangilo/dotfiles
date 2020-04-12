#!/bin/bash

function install {
  if ! which git &> /dev/null; then
    brew install git
  fi
}

function setup {
  ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
  ln -sf $DOTFILES/git/gitignore ~/.gitignore
}

install
setup
