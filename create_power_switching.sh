#!/bin/bash

# Usage:
# ./create_power_switching.sh <LOCATION_NAME> <CLIENT_NAME> <TASMOTA_NAME> <THRESHOLD>
#
#
#


cp oh2/items/myflat_LOCATION_POWER_SWITCHING.items myflat_$1_POWER_SWITCHING.items
cp oh2/rules/myflat_LOCATION_POWER_SWITCHING.rules myflat_$1_POWER_SWITCHING.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set LOCATION: $1"
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_POWER_SWITCHING.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_POWER_SWITCHING.rules

echo "Set CLIENT_NAME: $2"
sed -i "s/IR_REMOTE_NAME/$2/g" myflat_$1_POWER_SWITCHING.items
sed -i "s/IR_REMOTE_NAME/$2/g" myflat_$1_POWER_SWITCHING.rules

echo "Set TASMOTA_NAME: $3"
sed -i "s/TASMOTA_NAME/$3/g" myflat_$1_POWER_SWITCHING.items
sed -i "s/TASMOTA_NAME/$3/g" myflat_$1_POWER_SWITCHING.rules

echo "Set THRESHOLD: $4"
sed -i "s/THRESHOLD/$4/g" myflat_$1_POWER_SWITCHING.items
sed -i "s/THRESHOLD/$4/g" myflat_$1_POWER_SWITCHING.rules

echo "Moving File: myflat_$1_POWER_SWITCHING.items"

mv /etc/openhab2/items/myflat_$1_POWER_SWITCHING.items /etc/openhab2/items/myflat_$1_POWER_SWITCHING.old_items > /dev/null

mv myflat_$1_POWER_SWITCHING.items /etc/openhab2/items/myflat_$1_POWER_SWITCHING.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_POWER_SWITCHING.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_POWER_SWITCHING.items

echo "Moving File: myflat_$1_POWER_SWITCHING.rules"

mv /etc/openhab2/items/myflat_$1_POWER_SWITCHING.rules /etc/openhab2/rules/myflat_$1_POWER_SWITCHING.old_rules > /dev/null

mv myflat_$1_POWER_SWITCHING.rules /etc/openhab2/rules/myflat_$1_POWER_SWITCHING.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_POWER_SWITCHING.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_POWER_SWITCHING.rules
