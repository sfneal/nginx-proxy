#!/usr/bin/env bash

# Replace @VALIDATION_DOMAIN placeholder with env variable value
replace_domain --domain ${validation_domain} \
    --conf-file /etc/nginx/nginx.conf \
    --placeholder '@VALIDATION_DOMAIN'

# Test nginx service
nginx -t

sleep 10

# Start Nginx service
nginx -t
nginx -g "daemon off;"