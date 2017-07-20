#! /bin/bash
#This script accepts the database Mirror and checks the availability of mirrors.
if [ $# -lt 1 ]; then
	echo "Missed name server"
else
	for NAME in $@; do
		echo "
		<==== Check $NAME ====>"
		host $NAME | awk '{ 
		if ($4 ~ /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/){
		print "--- Check ip " $4 "---"; 
		system("ping -c 3 " $4);
		print "\n";}}'
		
done
fi
