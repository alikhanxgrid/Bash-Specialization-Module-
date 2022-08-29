#!/bin/bash
#input based on flags 
while [ $# -gt 0 ]; do
           case "$1" in
           	-f)		            # FileName of Server Names
                    shift
                    serverFile=$1
                    shift
                    ;;
                -u)		            # UserName of new user
                    shift
                    userName=$1
                    shift
                    ;;
                -p)		            # PAssword of new user
                    shift
                    password=$1
                    shift
                    ;;
                 *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  
# Read File of server Names and get values
while IFS= read -r line; do
    server1=$(cut -d' ' -f1 <<< "$line")
    server2=$(cut -d' ' -f2 <<< "$line")
    echo First server name is $server1
    echo Second server name is $server2
done < "$serverFile"

echo "Adding user on the servers......."

# Create a user with the credentials passed in the command on the remote server
ssh -o StrictHostKeyChecking=No $server1 "sudo useradd -m -p '$(openssl passwd -1 "$password")' $userName"
    if [ $? -eq 0 ]; then
        echo "User $userName added on $server1"
    else
        echo "Error on adding user $userName at $server1"
    fi
     
ssh -o StrictHostKeyChecking=No $server2 "sudo useradd -m -p '$(openssl passwd -1 "$password")' $userName"
if [ $? -eq 0 ]; then
        echo "User $userName added on $server2"
    else
        echo "Error on adding user $userName at $server2"
    fi
