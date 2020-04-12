#!/bin/bash

set -ex

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh zsh
  rm -rf ~/.zsh/oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.zsh/oh-my-zsh
}

function setup {
  ln -sf $DIR/zshrc ~/.zshrc
  ln -sf $DIR/aliases ~/.aliases
  ln -sf $DIR/zsh_profile ~/.zsh_profile
}

install
setup
