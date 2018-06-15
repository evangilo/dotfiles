#!/bin/bash

echo "Install github.com/vim/vim"

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
	--with-compiledby="evangilo" \
	--enable-fail-if-missing

make
sudo make install
