#!/bin/bash

function install {
  fonts_dir=$(mktemp -d)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cp $DOTFILES/fonts/Roboto_Mono_for_Powerline.ttf /Library/Fonts
  else
    git clone https://github.com/powerline/fonts.git --depth=1 $fonts_dir
    sh $fonts_dir/install.sh 
  fi
}

function setup {
  echo "no-op"
}

install
setup
