#!/bin/bash

# exit when any command fails
set -e

ENV_FILE=""
SSH_CONFIG=~/.ssh/config
<<<<<<< HEAD
SERVER_NAMES=()
SERVER_NAMES_FILE="server-names.txt"
=======
>>>>>>> c90d3827efd26e20d481ed446eafe4afe95371fc

while getopts 'f:' OPTION; do
  case "$OPTION" in
  f)
    ENV_FILE="$OPTARG"
    if test -f "$ENV_FILE"; then
      echo "$ENV_FILE exists."
      source $ENV_FILE
      N_SERVER=$N_SERVERS vagrant up
      if ! test -f "$SSH_CONFIG"; then
        touch $SSH_CONFIG
<<<<<<< HEAD
      else
        echo ''>$SSH_CONFIG
      fi

      for i in $(seq 1 $N_SERVERS); do
        echo "$(N_SERVER=$i vagrant ssh-config)" > $SSH_CONFIG
        name="$(N_SERVER=$i vagrant ssh-config | head -n 1 | sed 's/Host //g')"
        SERVER_NAMES+=($name)
      done
      { echo "${SERVER_NAMES[*]}"; } > $SERVER_NAMES_FILE
=======
      fi

      for i in $(seq 1 $N_SERVERS); do
        n=`expr 20 + $i` ##https://stackoverflow.com/questions/22460266/linux-bash-for-loop-and-function-for-adding-numbers
        ip="192.168.56.$n"
        name="server_$n"
      done
>>>>>>> c90d3827efd26e20d481ed446eafe4afe95371fc
    else
      echo "$ENV_FILE does not exist."
    fi
    ;;
  ?)
    echo "script usage: create-servers.sh [-f filename]" >&2
    exit 1
    ;;
  esac
done
shift "$(($OPTIND - 1))"
