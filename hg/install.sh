#!/bin/bash

function install {
  brew install mercurial
}

function setup {
  ln -sf $DOTFILES/hg/hgrc ~/.hgrc
  ln -sf $DOTFILES/hg/hgignore ~/.hgignore
}

install
setup
