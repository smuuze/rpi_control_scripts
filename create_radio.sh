#!/bin/bash

# Usage:
# ./create_radio.sh <LOCATION> <CLIENT_NAME>
#
#
#


cp oh2/items/myflat_LOCATION_RADIO.items myflat_$1_$2.items
cp oh2/rules/myflat_LOCATION_RADIO.rules myflat_$1_$2.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set Location: $1"

sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2.rules

echo "Set Radio: $2"
sed -i "s/RADIO_NAME/$2/g" myflat_$1_$2.items
sed -i "s/RADIO_NAME/$2/g" myflat_$1_$2.rules

echo "Moving File: myflat_$1_$2.items"

mv /etc/openhab2/items/myflat_$1_$2.item /etc/openhab2/items/myflat_$1_$2.old_items 2> /dev/null
mv /etc/openhab2/items/myflat_$1_$2.rules /etc/openhab2/rules/myflat_$1_$2.old_rules 2> /dev/null

mv myflat_$1_$2.items /etc/openhab2/items/myflat_$1_$2.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2.items

mv myflat_$1_$2.rules /etc/openhab2/rules/myflat_$1_$2.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2.rules
