#! /bin/bash

# Default directory for listing files
directory='/home/ubuntu/Desktop/TestFolder'
# Default directory for copying files to
targetFolder='/home/ubuntu/Desktop/TestFolder'

# Defined custom flags for terminal input
while [ $# -gt 0 ]; do
           case "$1" in
                -i)		# For Ip Address of remote machine
                    shift
                    ip=$1
                    shift
                    ;;
                -u)		# For username of remote machine
                    shift
                    userName=$1
                    shift
                    ;;
                -p)		# password of remote machine
                    shift
                    password=$1
                    shift
                    ;;
                -c)		# command that you want to run 
                		#(l=list files, r=read file, rm=delete file, s=send file to remote machine, a=append data to a file on remote server)
                    shift
                    command=$1
                    shift
                    ;;
                -d)             # Directory path to read file from Default is set to /home/ubuntu/Desktop/TestFolder
                    shift
                    directory=$1
                    shift
                    ;;
                -f)           	# File name & path for reading, deleting or sending file
                    shift
                    fileName=$1
                    shift
                    ;;
                -t)             # Target Folder to send file to
                    shift
                    targetFolder=$1
                    shift
                    ;;
                -w)		# Word to add to the file
                    shift
                    text=$1
                    shift
                    ;;
                *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  
  
  # To List files in the directory
  if [ "$command" = "l" ]	# required flags= -i, -u, -p, -c	Optional flags= -d
  then
  	sshpass -p $password ssh -o StrictHostKeyChecking=No $userName@$ip "ls '$directory'"
  
  # To read a file from any directory
  elif [ "$command" = "r" ]	# required flags= -i, -u, -p, -c, -f	Optional flags= none
  then
  	sshpass -p $password ssh -o StrictHostKeyChecking=No $userName@$ip "cat '$fileName'"
  
  # To delete a file 
  elif [ "$command" = "rm" ]	# required flags= -i, -u, -p, -c, -f	Optional flags= none
  then
  	sshpass -p $password ssh -o StrictHostKeyChecking=No $userName@$ip "rm -r -f '$fileName'"
  
  # To copy file from local machine to remote machine
  elif [ "$command" = "s" ]	# required flags= -i, -u, -p, -c, -f	Optional flags= -t
  then
  	sshpass -p $password scp -o StrictHostKeyChecking=No "$fileName" $userName@$ip:"'$targetFolder'"
  	
  # To append data to a file
  elif [ "$command" = "a" ]	# required flags= -i, -u, -p, -c, -f, -w	Optional flags= none
  then
  	sshpass -p $password ssh -o StrictHostKeyChecking=No $userName@$ip "echo $text>>'$fileName'"
  fi
  
  
  
  
  
  
  
  
  
  
  
  
