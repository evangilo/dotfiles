#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  if ! which git &> /dev/null; then
    brew install mercurial
  fi
}

function setup {
  ln -sf $DIR/hgrc ~/.hgrc
  ln -sf $DIR/hgignore ~/.hgignore
}

install
setup
