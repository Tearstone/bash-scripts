#!/bin/bash


if [ $# -lt 1 ]; then
echo "Please supply a list of IP addresses"
echo "Example: " $0 "list.txt"
exit
fi

#Set some variables
LIST=($(cat ./$1 | tr , '\n' | tr -d '\r'))
COUNT=0

# Function for removing dots and converting to hex
p()(printf %02x ${1//./ })

# Enumerate the array of IPs
for RANGE in ${LIST[@]};do
IFS=- read IP1 IP2 <<< $RANGE

if [ -z $IP2 ]; then
COUNT=$[COUNT + 1]

else

r=$[0x`p $IP1`-0x`p $IP2`]
COUNT=$[COUNT + $[1+${r/-}]]

fi
done


echo "The count is" $COUNT
