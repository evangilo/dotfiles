#!/bin/bash

set -ex

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi

if [ -d "$DOTFILES" ]; then
  git --work-tree=$DOTFILES --git-dir=$DOTFILES/.git pull origin master
else
  git clone https://github.com/evangilo/dotfiles.git $DOTFILES
fi
  
find  -L $DOTFILES -type f  -name "install.sh" -exec /bin/bash {} \;
