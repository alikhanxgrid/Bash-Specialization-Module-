#!/bin/bash
#input based on flags 
while [ $# -gt 0 ]; do
           case "$1" in
           	-sd)		            # Source Directory for Backup 
                    shift
                    SOURCE_DIR=$1
                    shift
                    ;;
                -td)		            # Target (Destination) Directory for Backup
                    shift
                    TARGET_DIR=$1
                    shift
                    ;;
                -ds)		            # Destination server for backup	(username@ip)
                    shift
                    DEST_SERVER=$1
                    shift
                    ;;
                 *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  


# Backup data in .tor format to remote server

BACKUP_DATE=$(date +%m-%d-%Y)

echo "Starting backup of: ${SOURCE_DIR[@]}"

for i in "${SOURCE_DIR[@]}"; do
sudo tar -Pczf $i-$BACKUP_DATE.tar.gz $i
if [ $? -eq 0 ]; then
echo "$i backup succeeded."
else
echo "$i backup failed."
fi
scp $i-$BACKUP_DATE.tar.gz $DEST_SERVER:$TARGET_DIR
if [ $? -eq 0 ]; then
echo "$i transfer succeeded."
else
echo "$i transfer failed."
fi
done

sudo rm $SOURCE_DIR/*.gz
echo "Backup is done."
