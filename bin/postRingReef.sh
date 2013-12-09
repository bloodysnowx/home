#/bin/sh

TOKEN="Z2B9HD1PYU7G2H_7b970d49-f9dc-4168-8eec-3acf63707ab1"
#GROUP_ID="1E7OE60R9QALD"
GROUP_ID="2E9RXP7DUFE7Y"

#curl -d 'token=${TOKEN}' -d 'group_id=${GROUP_ID}' -d 'text=$1' -d 'ext=json' http://ringreef.com/api/2/message/new
curl -d "token=${TOKEN}" -d "group_id=${GROUP_ID}" -d "text=$1" -d 'ext=json' http://ringreef.com/api/2/message/new
