#!/bin/bash

ipdiff() {
  declare -i dec1 dec2 diff # set integer attribute
  dec1=$1*256*256*256+$2*256*256+$3*256+$4
  dec2=$5*256*256*256+$6*256*256+$7*256+$8
  diff=$[$dec2-$dec1+1]
  counter=counter+$diff
}

declare -i counter

# read IP(s) from file, replace . and - by whitespace
while IFS=".-" read -r a1 a2 a3 a4 b1 b2 b3 b4; do
# declare -i a1 a2 a3 a4 b1 b2 b3 b4
  if [[ -z $b1 ]]; then     # $b1 is empty (line with one IP)
    counter=counter+1
  else                      # $b1 is not empty (line with 2 IPs)
    ipdiff $a1 $a2 $a3 $a4 $b1 $b2 $b3 $b4
  fi
# done < file
done < $1

echo $counter
