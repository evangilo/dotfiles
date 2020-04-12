#!/bin/bash

function install {
  for program in "$@"; do
    if which $program &> /dev/null; then
      continue
    fi

    if which pacman &> /dev/null; then
      sudo pacman -S $program --noconfirm
    elif which apt-get &> /dev/null; then
      sudo apt-get install $program --yes
    elif which brew &> /dev/null; then
      brew install $program
    fi
  done
}

install $@
