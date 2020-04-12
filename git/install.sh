#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  if ! which git &> /dev/null; then
    brew install git
  fi
}

function setup {
  ln -sf $DIR/gitconfig ~/.gitconfig
  ln -sf $DIR/gitignore ~/.gitignore
}

install
setup
