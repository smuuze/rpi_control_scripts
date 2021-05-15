#!/bin/bash

# Usage:
# ./create_tasmota.sh <LOCATION> <CLIENT_NAME>
#
#
#

# Count Files that are already available
# find /etc/openhab2/items/ -maxdepth 1 -type f | grep TASMOTA.items | wc -l
client_count=$(find /etc/openhab2/items/ -maxdepth 1 -type f | grep TASMOTA.items | wc -l)
new_client_count=$(expr $client_count + 1)

echo "Available clients: $client_count"
echo "New client number: $new_client_count"

cp oh2/items/myflat_LOCATION_TASMOTA.items myflat_$1_$2_TASMOTA.items
cp oh2/rules/myflat_LOCATION_TASMOTA.rules myflat_$1_$2_TASMOTA.rules

# check if the file already exists

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

# Replace Location

echo "Set Location: $1"
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TASMOTA.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_TASMOTA.rules

# Replace Client-Name

echo "Set TASMOTA: $2"
sed -i "s/CLIENT_NAME/$2/g" myflat_$1_$2_TASMOTA.items
sed -i "s/CLIENT_NAME/$2/g" myflat_$1_$2_TASMOTA.rules

# Set __CLIENT_NUMBER__

echo "Moving File: myflat_$1_$2_TASMOTA.items"
sed -i "s/__CLIENT_NUMBER__/$new_client_count/g" myflat_$1_$2_TASMOTA.rules
sed -i "s/__CLIENT_NUMBER__/$new_client_count/g" myflat_$1_$2_TASMOTA.items

mv /etc/openhab2/items/myflat_$1_$2_TASMOTA.item /etc/openhab2/items/myflat_$1_$2_TASMOTA.old_items > /dev/null

mv myflat_$1_$2_TASMOTA.items /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_TASMOTA.items

echo "Moving File: myflat_common_TASMOTA.items"

cp oh2/items/myflat_common_TASMOTA.items /etc/openhab2/items/myflat_common_TASMOTA.items
chmod ug=+rwx /etc/openhab2/items/myflat_common_TASMOTA.items
chown openhab:openhab /etc/openhab2/items/myflat_common_TASMOTA.items

echo "Moving File: myflat_$1_$2_TASMOTA.rules"

mv /etc/openhab2/items/myflat_$1_$2_TASMOTA.rules /etc/openhab2/rules/myflat_$1_$2_TASMOTA.old_rules > /dev/null

mv myflat_$1_$2_TASMOTA.rules /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
