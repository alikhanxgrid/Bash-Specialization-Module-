# Bash Specialization Module

## *Automating user and server management with Bash scripts*

<!-- Xgrid Learning and Development Program -->

This module focuses on getting hands-on experience in Bash by creating servers and automating user management on these servers using Bash. 

### Tools & Technologies used:

- [Vagrant](https://www.vagrantup.com/)
- [Virtual Box](https://www.virtualbox.org/)
- [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) 


### Estimated Time To Complete:

1 sprint = 1 week

### Development Environment:
- [Install Vagrant](https://www.vagrantup.com/docs/installation)
- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Operating system that supports running bash scripts 

## Tasks 

#### Create Server Script 
1. Create a VagrantFile which contains a loop to create "N" number of servers. Where "N" is a variable whose value will be passed as an environment variable when running the file.
2. Write a bash script that loads environment variable from a file. The file  contains variable whose value is a number. The number will represent the servers that need to be created when the script is run. 
3. This script takes the environment variable file as a custom flag (-f) which would be compulsory flag and also check if the file passed exists or not. 
4. If the file exists run the command to create servers from VagrantFile and pass the variable loaded from environment file as an environment variable to command.
5. Create a ssh config file at path "~/.ssh/config" and add the info about the servers by running vagrant ssh-config to config file. Also extract the host names of the servers, add them to an array and write the host names to a file "server-names.txt".

#### Create user script
1. TODO

#### Backup data script
1. TODO

## Deliverables

Acceptance criteria for the sprint are as follows: 
- Create server script must add names of all the servers created to ~/.ssh/config so that they can be accessed easily using ssh [host name]. Also it must create a txt file which have all the host names of created servers which can be loaded by create user script.
- TODO [create user script]
- TODO [backup data script]

