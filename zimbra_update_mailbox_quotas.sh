#! /bin/bash

QUOTASIZE=10485760000 #10G
SERVER=zimbra.isu.ifmo.ru

for P in `zmprov gqu @$SERVER |  awk -v Q=$QUOTASIZE '{ if (($2 < Q) && ($2 != 0)) { print  $1 } }'`; do 
	echo change $P
	zmprov ma $P zimbraMailQuota "" #reset to Class Of Service
	#zmprov ma $P zimbraMailQuota $QUOTASIZE # set new quota
  done
