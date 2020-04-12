#!/bin/bash

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd )"

function install {
  vim_source=$(mktemp -d)
  git clone https://github.com/vim/vim $vim_source
  cd $vim_source/src
  make distclean
  cd ..

  ./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-luainterp \
    --with-luajit \
    --enable-cscope \
    --with-features=huge \
    --enable-fontset \
    --enable-largefile \
    --with-compiledby="$USER" \
    --enable-fail-if-missing

  make
  sudo make install
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall < /dev/tty
}

function setup {
  ln -sf $DIR/vimrc ~/.vimrc
}

install
setup
