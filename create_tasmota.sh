#!/bin/bash

# Usage:
# ./create_tasmota.sh <LOCATION> <CLIENT_NAME>
#
#
#


cp oh2/items/myflat_LOCATION_TASMOTA.items myflat_$1_$2_TASMOTA.items
cp oh2/rules/myflat_LOCATION_TASMOTA.rules myflat_$1_$2_TASMOTA.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set Location: $1"

sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TASMOTA.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TASMOTA.rules

echo "Set TASMOTA: $2"
sed -i "s/TASMOTA_NAME/$2/g" myflat_$1_$2_TASMOTA.items
sed -i "s/TASMOTA_NAME/$2/g" myflat_$1_$2_TASMOTA.rules

echo "Moving File: myflat_$1_$2_TASMOTA.items"

mv /etc/openhab2/items/myflat_$1_$2_TASMOTA.item /etc/openhab2/items/myflat_$1_$2_TASMOTA.old_items 2> /dev/null

mv myflat_$1_$2_TASMOTA.items /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_TASMOTA.items

echo "Moving File: myflat_$1_$2_TASMOTA.rules"

mv /etc/openhab2/items/myflat_$1_$2_TASMOTA.rules /etc/openhab2/rules/myflat_$1_$2_TASMOTA.old_rules 2> /dev/null

mv myflat_$1_$2_TASMOTA.rules /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
