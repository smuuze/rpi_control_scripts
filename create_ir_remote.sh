#!/bin/bash

# Usage:
# ./create_ir_remote.sh <LOCATION> <CLIENT_NAME>
#
#
#


cp oh2/items/myflat_LOCATION_IR_REMOTE.items myflat_$1_$2_IR_REMOTE.items
cp oh2/rules/myflat_LOCATION_IR_REMOTE.rules myflat_$1_$2_IR_REMOTE.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set Location: $1"

sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_IR_REMOTE.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_IR_REMOTE.rules

echo "Set IR_REMOTE: $2"
sed -i "s/IR_REMOTE_NAME/$2/g" myflat_$1_$2_IR_REMOTE.items
sed -i "s/IR_REMOTE_NAME/$2/g" myflat_$1_$2_IR_REMOTE.rules

echo "Moving File: myflat_$1_$2_IR_REMOTE.items"

mv /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.items /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.old_items 2> /dev/null

mv myflat_$1_$2_IR_REMOTE.items /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.items

echo "Moving File: myflat_$1_$2_IR_REMOTE.rules"

mv /etc/openhab2/items/myflat_$1_$2_IR_REMOTE.rules /etc/openhab2/rules/myflat_$1_$2_IR_REMOTE.old_rules 2> /dev/null

mv myflat_$1_$2_IR_REMOTE.rules /etc/openhab2/rules/myflat_$1_$2_IR_REMOTE.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_IR_REMOTE.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_IR_REMOTE.rules
