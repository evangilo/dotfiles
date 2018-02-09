#!/bin/bash

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi

function clone_or_rebase {
  if [ -d "$2" ]; then
    git --work-tree=$2 --git-dir=$2/.git pull origin master --rebase
  else
    git clone $1 $2
  fi
}

function pull_repo {
  clone_or_rebase https://github.com/evangilo/dotfiles.git $DOTFILES
}

function installer {
  if which pacman &> /dev/null; then
    sudo pacman -S $@
  elif which apt-get &> /dev/null; then
    sudo apt-get install $@
  elif which brew &> /dev/null; then
    brew install $@
  fi
}

function setup_vim {
  installer vim
  clone_or_rebase https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

function setup_emacs {
  installer emacs
}

function setup_zsh {
  installer zsh
  clone_or_rebase https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
}

function setup_pyenv {
  sudo easy_install virtualenvwrapper
}

function setup_tools {
  installer mercurial ncdu xsel
}

function create_links {
  ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
  ln -sf $DOTFILES/git/gitignore ~/.gitignore
  ln -sf $DOTFILES/hg/hgrc ~/.hgrc
  ln -sf $DOTFILES/hg/hgignore ~/.hgignore
  ln -sf $DOTFILES/vim/vimrc ~/.vimrc
  ln -sf $DOTFILES/emacs/emacs ~/.emacs
  ln -sf $DOTFILES/zsh/zshrc ~/.zshrc
  ln -sf $DOTFILES/zsh/aliases ~/.aliases
  ln -sf $DOTFILES/zsh/profile ~/.profile
}

pull_repo
setup_vim
setup_emacs
setup_zsh
setup_pyenv
setup_tools
create_links

printf "Done!\n"

