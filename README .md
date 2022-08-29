# Bash Specialization Module

## *Automating user and server management with Bash scripts*

<!-- Xgrid Learning and Development Program -->

This module focuses on getting hands-on experience in Bash Scripting by creating servers and automating user management on these servers using Bash. 

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
5. Create a ssh config file at path "~/.ssh/config" and add the info about the servers by running vagrant ssh-config to config file. Also extract the host names of the servers, add them to an array and write the host names to a file *server-names.txt*.

#### Create user script
Once the server has been created in the task 1, the next step is to create users on that remote server which includes following
1. Create a *create_user.sh* file and define 3 custom flags in this file.
2. Custom flags include one flag for server file i.e. *server-names.txt* created in step 5 of task 1, one flag for username of new user on remote server and one flag for password of new user.
3. The script should be able to read server names from the *server-names.txt* file and should create a user with the credentials passed in the command on all the servers in the file.
Here is how the sample command should look like while creating the user.
```
./create_user.sh -f server-names.txt -u testuser1 -p user@Password
```

#### Backup data script
Now we have created our server and user on that server, the next step is to use that server to backup our data from local machine.
1. Create *backup_data.sh* file and define custom flags for input.
2. One flag should be for source directory to backup, other one for target directory of the remote server to backup to and last one for username and ip of the server on which you want to backup to.
3. The data should be backed up on daily basis and the backup file should be named as per the current date.
4. The data should be backed up in .tar format and after successful backup, the backup file should be removed from the local machine. 
5. The backup process should be a crontab which automatically does backup of data on daily basis.
Sample command for backing up data
```
./backup_data.sh -sd /home/abid-iqbal/Desktop/bash -td /home/vagrant/backup -ds vagrant@192.168.56.21
```
## Deliverables

Acceptance criteria for the sprint are as follows: 
- Create server script must add names of all the servers created to ~/.ssh/config so that they can be accessed easily using ssh [host name]. Also it must create a txt file which have all the host names of created servers which can be loaded by create user script.
- Custom flags should be created for getting input on the terminal while running the scripts.
- create_user script should take server file as input and use the names in the file to create users.
- Backup data script should be added as crontab to run automatically after defined timeline and backup file should be successfully removed from the local machine after being sent to remote server.
