#! /bin/bash
#For all directories in /var/www/ creates a subdirectory of logs (if it did not exist) and generates a rule for logrotate

if [ $# -lt 1 ]; then
	echo "Missed filename"
else

echo "" > $1

for FILE in `ls /var/www`; do 
	if ! [ -d /var/www/$FILE/logs ]; then
		mkdir /var/www/$FILE/logs
	fi	

	echo 	"/var/www/$FILE/logs/*.log {
	daily
	create			
	size 100M	
	compress
	rotate 7
	noolddir
}" >> $1

done

fi
