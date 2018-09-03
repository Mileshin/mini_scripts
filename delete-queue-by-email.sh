#!/bin/sh
#only postfix
postqueue="/usr/sbin/postqueue -p"
postsuper="/usr/sbin/postsuper"
#zimbra
#postqueue="/opt/zimbra/common/sbin/postqueue -p"
#postsuper="/opt/zimbra/common/sbin/postsuper"
usage="usage: delete-queue-by-email [-p | -d] [-a | email]"

if [ $# -lt 1 ]; then
  echo "$usage"
else
while [ -n "$1" ]
do
case "$1" in
-h) echo "$usage
-p [email]  - see what would be deleted
-d [email]  - delete"
exit 0;;
#find
-p) email="$2"
if [ "$email" = "" ]; then
  echo "$usage"
  exit 1
elif [ "$email" = "-a" ]; then
  echo "These emails were found:"
  $postqueue | egrep -v '^ *\(|-Queue ID-' \
  | awk 'BEGIN { RS = "" }  { print $1 } ' | tr -d '*!'
else
  echo "These emails were found:"
  $postqueue | egrep -v '^ *\(|-Queue ID-' \
  | awk 'BEGIN { RS = "" } { if ($7 == "'"$email"'") print $1} ' | tr -d '*!'
fi
exit 0;;

#delete
-d)  email="$2"
if [ "$email" = "" ]; then
  echo "$usage"
  exit 1
elif [ "$email" = "-a" ]; then
  echo "These emails will be deleted:"
  $postqueue | egrep -v '^ *\(|-Queue ID-' \
  | awk 'BEGIN { RS = "" } { print $1 } ' \
  | tr -d '*!' | $postsuper -d -
else
  echo "These emails will be deleted:"
  $postqueue | egrep -v '^ *\(|-Queue ID-' \
  | awk 'BEGIN { RS = "" } { if ($7 == "'"$email"'") print $1} ' \
  | tr -d '*!' | $postsuper -d -
fi
exit 0;;
*) echo "$1 is not an option";;
esac
shift
done
fi
