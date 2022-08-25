#!/bin/bash

# exit when any command fails
set -e

ENV_FILE=""
SSH_CONFIG=~/.ssh/config

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
      fi

      for i in $(seq 1 $N_SERVERS); do
        n=`expr 20 + $i` ##https://stackoverflow.com/questions/22460266/linux-bash-for-loop-and-function-for-adding-numbers
        ip="192.168.56.$n"
        name="server_$n"
      done
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
