#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  bash $DIR/../pkg_install.sh zsh
}

function setup {
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.zsh/oh-my-zsh
  ln -sf $DIR/zshrc ~/.zshrc
  ln -sf $DIR/aliases ~/.aliases
  ln -sf $DIR/zsh_profile ~/.zsh_profile
}
