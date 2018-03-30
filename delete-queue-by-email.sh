#!/bin/bash
#only postfix
postqueue="/usr/sbin/postqueue -p"
postsuper="/usr/sbin/postsuper"
#zimbra
#postqueue="/opt/zimbra/common/sbin/postqueue -p"
#postsuper="/opt/zimbra/common/sbin/postsuper"

if [ $# -lt 1 ]; then
        echo "Missed arguments!"
else
while [ -n "$1" ]
do
case "$1" in
-h) echo "-p [email]  - see what would be deleted
-d [email]  - delete"
exit 0;;
#find
-p) email="$2"
if [ "$email" = "" ]; then
echo "Usage: $0 [email]"
echo "For delete all e-mails to [email] from any queue"
exit 1
fi
echo "These emails will be deleted:"
$postqueue | egrep -v '^ *\(|-Queue ID-' \
| awk 'BEGIN { RS = "" } { if ($7 == "'"$email"'") print $1} ' | tr -d '*!'
exit 0;;
#delete
-d)  email="$2"
if [ "$email" = "" ]; then
echo "Usage: $0 [email]"
echo "For delete all e-mails to [email] from any queue"
exit 1
fi
echo "These emails will be deleted:"
$postqueue | egrep -v '^ *\(|-Queue ID-' \
| awk 'BEGIN { RS = "" } { if ($7 == "'"$email"'") print $1} ' \
| tr -d '*!' | $postsuper -d -
exit 0;;
*) echo "$1 is not an option";;
esac
shift
done
fi
