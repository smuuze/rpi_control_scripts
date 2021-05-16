#!/bin/bash

# Usage:
# ./create_tasmota.sh <LOCATION> <CLIENT_NAME>
#
#
#

# First: move old item to ignore values in it
old_rule_file=/etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
if test -f "$old_rule_file"; then
	printf "Remofing old file: %s\n" $old_rule_file
	mv $old_rule_file /etc/openhab2/rules/myflat_$1_$2_TASMOTA.old_rules
fi

old_item_file=/etc/openhab2/items/myflat_$1_$2_TASMOTA.items
if test -f "$old_item_file"; then
	printf "Remofing old file: %s\n" $old_item_file
	mv $old_item_file /etc/openhab2/items/myflat_$1_$2_TASMOTA.old_items
fi

# Count Files that are already available
# find /etc/openhab2/items/ -maxdepth 1 -type f | grep TASMOTA.items | wc -l
#client_count=$(find /etc/openhab2/items/ -maxdepth 1 -type f | grep TASMOTA.items | wc -l)
#new_client_count=$(expr $client_count + 1)
max_value=0

for f in /etc/openhab2/rules/*_TASMOTA.rules; do

	line=$(grep -i CLIENT_NUMBER $f)
	value=${line//[!0-9]/}
	value=$(expr $value + 0)

	#printf "File: %s\n" $f
	#printf "Line: %s\n" $line
	#printf "Value: %d - Max: %d\n" $value $max_value

	if [ "$value" -gt "$max_value" ]; then
		max_value=$value
		#printf "%s %d\n" "New maximum:" $max_value
	fi
done

new_client_count=$(expr $max_value + 1)
printf "New CLIENT_NUMBER: %d\n" $new_client_count

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

mv myflat_$1_$2_TASMOTA.items /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chmod ug=+rwx /etc/openhab2/items/myflat_$1_$2_TASMOTA.items
chown openhab:openhab /etc/openhab2/items/myflat_$1_$2_TASMOTA.items

echo "Moving File: myflat_common_TASMOTA.items"

cp oh2/items/myflat_common_TASMOTA.items /etc/openhab2/items/myflat_common_TASMOTA.items
chmod ug=+rwx /etc/openhab2/items/myflat_common_TASMOTA.items
chown openhab:openhab /etc/openhab2/items/myflat_common_TASMOTA.items

echo "Moving File: myflat_common_TASMOTA.rules"

cp oh2/rules/myflat_common_TASMOTA.rules /etc/openhab2/rules/myflat_common_TASMOTA.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_common_TASMOTA.rules
chown openhab:openhab /etc/openhab2/rules/myflat_common_TASMOTA.rules

echo "Moving File: myflat_$1_$2_TASMOTA.rules"

mv myflat_$1_$2_TASMOTA.rules /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chmod ug=+rwx /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
chown openhab:openhab /etc/openhab2/rules/myflat_$1_$2_TASMOTA.rules
