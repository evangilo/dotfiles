#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh git
}

function setup {
  ln -sf $DIR/gitconfig ~/.gitconfig
  ln -sf $DIR/gitignore ~/.gitignore
}

install
setup
