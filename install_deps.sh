#!/bin/bash

function installer {
  if which pacman &> /dev/null; then
    sudo pacman -S $@;
  elif which apt-get &> /dev/null; then
    sudo apt-get install $@;
  elif which brew &> /dev/null; then
    brew install $@;
  fi
}

function install_programs {
  installer emacs vim mercurial zsh
}

function configure_vim {
  if [[ ! -d "~/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +qall
}

install_programs
configure_vim

