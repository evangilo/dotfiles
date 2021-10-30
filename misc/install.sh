#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh fzf ripgrep ncdu direnv
}

install
