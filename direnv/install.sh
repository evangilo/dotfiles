#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh direnv
}

function setup {
  mkdir -p ~/.config/direnv
  ln -sf $DIR/direnvrc ~/.config/direnv/direnvrc
}

install
setup
