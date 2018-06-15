#!/bin/bash

if [ -z "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi

GREEN="\e[1;32m"
RESET="\e[0m"

function println {
  printf "${GREEN}${1}${RESET}\n"
}

function clone_or_rebase {
  if [ -d "$2/.git" ]; then
    git --work-tree=$2 --git-dir=$2/.git pull origin master
  else
    git clone $1 $2
  fi
}

function pull_repo {
  println "Download dotfiles..."
  clone_or_rebase https://github.com/evangilo/dotfiles.git $DOTFILES
}

function installer {
  for p in "$@"; do
    if which $p &> /dev/null; then
      continue
    fi

    if which pacman &> /dev/null; then
      sudo pacman -S $p --noconfirm
    elif which apt-get &> /dev/null; then
      sudo apt-get install $p --yes
    elif which brew &> /dev/null; then
      brew install $p
    fi
  done
}

function setup_vim {
  println "Setup vim..."
  source $DOTFILES/vim/install.sh
  clone_or_rebase https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall < /dev/tty
}

function setup_emacs {
  println "Setup emacs..."
  installer emacs
}

function setup_zsh {
  println "Setup zsh..."
  installer zsh
  clone_or_rebase https://github.com/robbyrussell/oh-my-zsh.git ~/.zsh/oh-my-zsh
  clone_or_rebase https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

function setup_pyenv {
  println "Setup pyvenv..."
  installer python-setuptools
  sudo easy_install virtualenv virtualenvwrapper
}

function setup_nvm {
  println "Setup nvm..."
  clone_or_rebase https://github.com/creationix/nvm.git ~/.nvm
  source ~/.nvm/nvm.sh
  nvm install 8.0.0
}

function setup_tmux {
  println "Setup tmux..."
  installer tmux
}

function setup_tools {
  println "Setup extra tools..."
  installer mercurial ncdu xsel
}

function setup_fonts {
  fonts_dir=$(mktemp -d)
  println "Setup fonts..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cp $DOTFILES/fonts/Roboto_Mono_for_Powerline.ttf /Library/Fonts
  else
    clone_or_rebase "https://github.com/powerline/fonts.git --depth=1" $fonts_dir
    sh $fonts_dir/install.sh # Ubuntu Mono derivative Powerline
  fi
}

function create_links {
  println "Creating links..."
  ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
  ln -sf $DOTFILES/git/gitignore ~/.gitignore
  ln -sf $DOTFILES/hg/hgrc ~/.hgrc
  ln -sf $DOTFILES/hg/hgignore ~/.hgignore
  ln -sf $DOTFILES/vim/vimrc ~/.vimrc
  ln -sf $DOTFILES/emacs/emacs ~/.emacs
  ln -sf $DOTFILES/zsh/zshrc ~/.zshrc
  ln -sf $DOTFILES/zsh/aliases ~/.aliases
  ln -sf $DOTFILES/zsh/zsh_profile ~/.zsh_profile
  ln -sf $DOTFILES/tmux/tmux.conf ~/.tmux.conf
}

pull_repo
create_links
setup_vim
setup_emacs
setup_zsh
setup_nvm
setup_pyenv
setup_tmux
setup_tools
setup_fonts

println "Done!\n"

