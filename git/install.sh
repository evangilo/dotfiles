#!/bin/bash

function install {
  brew install git
}

function setup {
  ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
  ln -sf $DOTFILES/git/gitignore ~/.gitignore
}

install
setup
