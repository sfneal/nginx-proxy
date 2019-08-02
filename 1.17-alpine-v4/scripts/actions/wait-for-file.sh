#!/usr/bin/env bash

domain=${1}
wait_for_file=/etc/letsencrypt/renewal/${domain}.conf

if echo ${domain} | grep -q "localhost" ; then
    echo "Domain is a localhost, skipping" ${domain}
else
    until [[ -f ${wait_for_file} ]]
    do
        echo "File NOT found " ${wait_for_file}
        sleep 3
    done
    echo "File found " ${wait_for_file}
fi