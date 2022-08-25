#! /bin/bash

# Defined custom flags for terminal input
while [ $# -gt 0 ]; do
           case "$1" in
                -i)		            # For Ip Address of remote machine
                    shift
                    ip=$1
                    shift
                    ;;
                -u)		            # For username of remote machine
                    shift
                    userName=$1
                    shift
                    ;;
                -p)		            # password of remote machine
                    shift
                    password=$1
                    shift
                    ;;
                -c)		            # command that you want to run (c for creating user)
                    shift
                    command=$1
                    shift
                    ;;
                -un)                # UserName with which profile should be created
                    shift
                    userN=$1
                    shift
                    ;;
                -pp)                # Password of new user to be created on remote machine
                    shift
                    passwd=$1
                    shift
                    ;;
                *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  

  # To create user on the remote server
  if [ "$command" = "c" ]	# required flags= -i, -u, -p, -c, -un, -pp
  then
    sshpass -p $password ssh $userName@$ip "sshpass -p '$password' sudo useradd -m -p '$(openssl passwd -1 "$passwd")' $userN"
    if [ $? -eq 0 ]; then
        echo "User $userN added on $userName@$ip"
    else
        echo "Error on $ip"
    fi
  fi