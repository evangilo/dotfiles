#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  brew install emacs
}

function setup {
  ln -sf $DIR/emacs ~/.emacs
}

install
setup
