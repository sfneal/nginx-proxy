#!/usr/bin/env bash

max_attempts=10
attempts=1

domain=${1}
wait_for_file=/etc/letsencrypt/renewal/${domain}.conf

if echo ${domain} | grep -q "localhost" ; then
    echo "Domain is a localhost, skipping" ${domain}
else
    until [[ -f ${wait_for_file} ]] || [[ ${attempts} -eq ${max_attempts} ]]; do
        echo "File NOT found ${wait_for_file} Cert download attempt #$(( attempts++ ))..."
        sleep 5
    done
    echo "File found " ${wait_for_file}
fi