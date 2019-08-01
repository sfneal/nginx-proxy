#!/usr/bin/env bash

# Test nginx service
nginx -t
sleep 35

# Replace @VALIDATION_DOMAIN placeholder with env variable value
replace_domain --domain ${validation_domain} \
    --conf-file /etc/nginx/nginx.conf \
    --placeholder '@VALIDATION_DOMAIN'

# Enable nginx configurations for each site
for d in ${domain}; do
    # Split the "domain:webserver" string
    url_server=(${d//:/ })

    # Run enable-conf.sh
    sh /scripts/actions/enable-servers.sh ${url_server[0]} ${url_server[1]}
done

# Wait for all SSL cert files to appear before starting Nginx server
for d in ${domain}; do
    # Split the "domain:webserver" string
    url_server=(${d//:/ })

    wait_for_file=/etc/letsencrypt/renewal/${url_server[0]}.conf
    until [[ -f ${wait_for_file} ]]
    do
        echo "File NOT found " ${wait_for_file}
         sleep 3
    done
    echo "File found " ${wait_for_file}
done

# Start Nginx service
nginx -t
nginx -g "daemon off;"