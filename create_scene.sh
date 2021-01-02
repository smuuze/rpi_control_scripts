#!/bin/bash

# Usage:
# ./create_scene.sh <LOCATION> <SCENE_NAME>
#
#
#


cp oh2/items/myflat_LOCATION_SCENE.items myflat_$1_$2_SCENE.items
cp oh2/rules/myflat_LOCATION_SCENE.rules myflat_$1_$2_SCENE.rules

#echo "Replacing incorrect file endings"
#sed -i -e 's/\r$//g' myflat_$1_$2.items

echo "Set Location: $1"

sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_SCENE.items
sed -i "s/LOCATION_NAME/$1/g" myflat_$1_$2_SCENE.rules

echo "Set TASMOTA: $2"
sed -i "s/SCENE_NAME/$2/g" myflat_$1_$2_SCENE.items
sed -i "s/SCENE_NAME/$2/g" myflat_$1_$2_SCENE.rules

echo "Moving File: myflat_$1_$2_SCENE.items"

mv /etc/openhab2/items/myflat_$1_$2_SCENE.item /etc/openhab2/items/myflat_$1_$2_SCENE.old_items 2> /dev/null

mv myflat_$1_$2_SCENE.items /etc/openhab2/items/myflat_$1_$2_SCENE.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_SCENE.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_SCENE.items

echo "Moving File: myflat_$1_$2_SCENE.rules"

mv /etc/openhab2/items/myflat_$1_$2_SCENE.rules /etc/openhab2/rules/myflat_$1_$2_SCENE.old_rules 2> /dev/null

mv myflat_$1_$2_SCENE.rules /etc/openhab2/rules/myflat_$1_$2_SCENE.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_SCENE.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_SCENE.rules
