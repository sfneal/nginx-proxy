#!/usr/bin/env bash

# Test nginx service
nginx -t
sleep 20

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

# Start Nginx service
nginx -t
nginx -g "daemon off;"