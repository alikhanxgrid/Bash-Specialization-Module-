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
                -f)           	    # File name & path for reading, deleting or sending file
                    shift
                    fileName=$1
                    shift
                    ;;
                -t)                 # Target Folder to send file to
                    shift
                    targetFolder=$1
                    shift
                    ;;
                *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  
  
  # To copy file from local machine to remote machine
  if [ "$command" = "s" ]	# required flags= -i, -u, -p, -c, -f, -t
  then
  	sshpass -p $password scp -o StrictHostKeyChecking=No "$fileName" $userName@$ip:"'$targetFolder'"