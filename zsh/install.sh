#!/bin/bash

function install {
  brew install zsh
}

function setup {
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.zsh/oh-my-zsh
  ln -sf $DOTFILES/zsh/zshrc ~/.zshrc
  ln -sf $DOTFILES/zsh/aliases ~/.aliases
  ln -sf $DOTFILES/zsh/zsh_profile ~/.zsh_profile
}
