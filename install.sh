#!/bin/bash

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi

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

function link {
  ln -sf $DOTFILES/$1 $HOME/$2
}

link "git/gitconfig" ".gitconfig"
link "git/gitignore" ".gitignore"
link "hg/hgrc" ".hgrc"
link "hg/hgignore_global" ".hgignore_global"
link "vim/vimrc" ".vimrc"
link "emacs/emacs" ".emacs"
link "zsh/zshrc" ".zshrc"
link "zsh/aliases" ".aliases"
link "zsh/profile" ".profile"

printf "Done!\n"

