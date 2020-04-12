#!/bin/bash

function install {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git switch -c "$(git describe --abbrev=0 --tags)"

  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
}

function setup {
  source $HOME/.asdf/asdf.sh
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  asdf plugin-add python
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
}

install
setup
