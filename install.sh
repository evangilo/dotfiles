#!/bin/bash

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi

function pull_repo {
  if [ -d "$DOTFILES" ]; then
    env git --work-tree=$DOTFILES --git-dir=$DOTFILES/.git pull origin master || {
      printf "Error: git pull of dotfiles repo failed.\n"
      exit 1
    }
  else
    env git clone https://github.com/evangilo/dotfiles.git $DOTFILES || {
      printf "Error: git clone of dotfiles repo failed.\n"
      exit 1
    }
 fi
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
  installer emacs vim mercurial zsh ncdu
}

function configure_vim {
  if [[ ! -d "~/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +qall
}

pull_repo
create_links
install_programs
configure_vim

printf "Done!\n"

