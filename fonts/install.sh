#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  fonts_dir=$(mktemp -d)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cp $DIR/Roboto_Mono_for_Powerline.ttf /Library/Fonts
  else
    git clone https://github.com/powerline/fonts.git --depth=1 $fonts_dir
    sh $fonts_dir/install.sh 
  fi
}

install
