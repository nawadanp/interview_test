#!/bin/bash

## Shell answers should be shared in the one liner format.

########################################
# 1) Extract the list of all the status returned, count and sort them.
# Find two ways to achieve this, 
# one using `jq` + one using standard tools available on UNIX systems. Expected output:
#```
#<Number of events> <status code>
#<Number of events> <status code>
#...
#```
jq -sr 'map({status_code: .status_code})|sort|group_by(.status_code)|unique_by(.[].status_code)|map([(length|tostring),(" "|tostring),(.[0].status_code|tostring)])|(.[]|add)' access.log;
cat access.log| grep -Po '"status_code": \K[0-9]*' | sort | uniq -c;

########################################
# 2) How many GET events came on `api.sendinblue.com/users`?
jq -sr 'map({http_request: (select(.http_request == "GET /users"))})|length' access.log


########################################
#3) Do a reverse DNS resolution for all IPs (excluding local IPs) listed in the log file. Expected output:
#```
#IP: xxx.xxx.xxx.xxx / Reverse: foo.example.net
#IP: xxx.xxx.xxx.xxy / Reverse: bar.example.net
#...
#```
jq -sr 'map({IP: (select(.source_ip != "127.0.0.1"))})|"IP: "+.[].IP["source_ip"]+" / Reverse: "+.[].IP["host"]' access.log

########################################
# Bonus: Which request is an April joke? Why?
echo -e "The 418 status code is an April joke request\n\nBecause great computer scientists have a very good sense of humor and can make very good tea on their own"
