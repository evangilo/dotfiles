#!/bin/bash

set -ex

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi
  
find  -L $DOTFILES -type f  -name "install.sh" -exec /bin/bash {} \;
