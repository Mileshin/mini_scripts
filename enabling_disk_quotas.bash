#!/bin/bash
#If ispmanager5 is installed,  this script finds the DefaultHomedDir and checks for quotas.
export `/usr/local/mgr5/sbin/mgrctl -m ispmgr pathlist |grep DefaultHomeDir ||  /usr/local/mgr5/sbin/mgrctl -m ispmgrnode pathlist |grep DefaultHomeDir`
echo "Home dir: $DefaultHomeDir"
export R=`df $DefaultHomeDir |tail -1 | awk '{print $6}'`
echo "Section: $R"
ANS=`mount | grep "on $R"`

if [ -z "$ANS" ]; then
	echo "Warning! No matches found."
	echo "$ANS"
  else
	echo "$ANS"
	ANS=`echo $ANS | egrep "grpquota.*usrquota|usrquota.*grpquota"`
	if [ -z "$ANS" ]; then
		echo "No 'grpquota,usrquota'. You must add in  /etc/fstab 
			UUID=<UUID> $R   ext4    defaults,grpquota,usrquota   1 1
			and exec
			mount -o remount $R"
		
	  else
		echo "OK"
		#quotacheck -gum /var/www/
		#quotaon -guv /var/www/
	fi
fi
