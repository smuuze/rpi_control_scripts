#!/bin/bash

# Usage:
# ./create_tv.sh <LOCATION> <CLIENT_NAME>
#
#
#


cp oh2/items/myflat_LOCATION_TV.items myflat_$1_$2_TV.items
cp oh2/rules/myflat_LOCATION_TV.rules myflat_$1_$2_TV.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set Location: $1"

sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TV.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TV.rules

echo "Set TV: $2"
sed -i "s/TV_NAME/$2/g" myflat_$1_$2_TV.items
sed -i "s/TV_NAME/$2/g" myflat_$1_$2_TV.rules

echo "Moving File: myflat_$1_$2_TV.items"

mv /etc/openhab2/items/myflat_$1_$2_TV.item /etc/openhab2/items/myflat_$1_$2_TV.old_items 2> /dev/null

mv myflat_$1_$2_TV.items /etc/openhab2/items/myflat_$1_$2_TV.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_TV.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_TV.items

echo "Moving File: myflat_$1_$2_TV.rules"

mv /etc/openhab2/items/myflat_$1_$2_TV.rules /etc/openhab2/rules/myflat_$1_$2_TV.old_rules 2> /dev/null

mv myflat_$1_$2_TV.rules /etc/openhab2/rules/myflat_$1_$2_TV.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_TV.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_TV.rules
