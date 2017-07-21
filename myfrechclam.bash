#!/bin/bash
# This script deletes clamav files and tightens their latest versions.
# Author: ekzorchik
# URL: http://www.ekzorchik.ru/2015/11/i-can-not-update-the-virus-database/

rm -Rf /tmp/clamav

mkdir /tmp/clamav

cd /tmp/clamav

wget http://database.clamav.net/main.cvd

wget http://database.clamav.net/daily.cvd

wget http://database.clamav.net/bytecode.cvd

mv daily.cvd /var/lib/clamav/

mv main.cvd /var/lib/clamav/

mv bytecode.cvd /var/lib/clamav/

/etc/init.d/clamav-freshclam restart

#Current Version now"

echo "freshclam --version
