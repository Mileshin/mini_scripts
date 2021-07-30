#!/bin/bash

shopt -s nullglob

arr=(/sys/class/scsi_host/*)
REGEX="^\/sys\/class\/scsi_host\/host[0-9]*$"

for f in "${arr[@]}"; do
	if [[ "$f" =~ $REGEX ]]; 
	then 
		echo "- - -" > ${f}/scan
		echo ${f}/scan
	fi
	
done
