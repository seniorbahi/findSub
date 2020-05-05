#!/bin/bash

mkdir thirdlevels

echo "Please Enter The List Domain:"
read domain
echo "Gathering Full third-level Domains With Amass..."
for domain in $(cat $domain); do amass enum --passive -d $domain -o thirdlevels/$domain.txt; cat thirdlevels/$domain.txt | sort -u >> final.txt;done
echo "Probing for alive third-levels..."
cat final.txt | /home/bahisec/go/bin/httprobe > probed.txt
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
