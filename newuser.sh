#!/bin/bash

####
#
# Creates user with a random 16 chacter password
#
###

if [ $# -lt 1 ]; then
echo "Please supply a user name"
echo "Example: " $0 "jsmith"
exit
fi

# Declare local variables

path=/export/ftp/pub/discrwrd
randompw=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9@#$%' | fold -w 16 | head -n 1)

useradd $1
echo $1:$randompw | chpasswd
echo "UserID:" $1 "has been created with the following password:" $randompw
