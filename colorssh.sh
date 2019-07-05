function colorssh() {
  production_server=1
  colorssh_servers="$HOME/.colorssh_servers"

  while IFS= read -r server; do
    if [[ $@ =~ $server ]] ; then
      production_server=0
    fi
  done < $colorssh_servers

  if [ $production_server == 1 ]; then
    echo -e "\033]50;SetProfile=production\a";
  fi

  ssh $*;

  echo -e "\033]50;SetProfile=Default\a";
}

alias ssh="colorssh"
