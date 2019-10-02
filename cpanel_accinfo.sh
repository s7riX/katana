#!/bin/bash

##Defining color codes
grn=$'\e[1;32m'
blu=$'\e[1;34m'
cyn=$'\e[1;36m'
white=$'\e[0m'

##Getting user list
users=(`cat /etc/trueuserowners | awk '{print $1}' | tr -d :`)

##Getting domain info of all users
for i in "${users[@]}"; do
echo "$red ####################################### $white"
echo "$grn ##Main domain of user ${i}"
echo "=============="
cat /etc/userdatadomains | grep $i | grep main | awk '{print $1}' | tr -d :
echo "$cyn ##Addon domains of user ${i}"
echo "=============="
cat /etc/userdatadomains | grep $i | grep addon | awk '{print $1}' | tr -d :
echo "$blu ##Subdomains of user ${i}"
echo "=============="
cat /etc/userdatadomains | grep $i | grep sub | awk '{print $1}' | tr -d :
done
echo "$white Thank you"
