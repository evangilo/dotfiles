#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh mercurial
}

function setup {
  ln -sf $DIR/hgrc ~/.hgrc
  ln -sf $DIR/hgignore ~/.hgignore
}

install
setup
