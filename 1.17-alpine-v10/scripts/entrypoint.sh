#!/usr/bin/env bash

# Test nginx service
nginx -t

# Replace @VALIDATION_DOMAIN placeholder with env variable value
replace_domain --domain ${validation_domain} \
    --conf-file /etc/nginx/nginx.conf \
    --placeholder '@VALIDATION_DOMAIN'

# Make directory for cached files
mkdir -p /data/nginx/cache/

# Check if cache is enabled and use corresponding template.conf
if [[ ! ${cache_enabled} == 1 ]]; then
    echo "Static asset cache DISABLED"
    cp /scripts/template-nocache.conf /scripts/template.conf
    rm /scripts/template-nocache.conf
else
    echo "Static asset cache ENABLED"
fi


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
    domain=${url_server[0]}

    sh /scripts/actions/wait-for-file.sh ${domain}
done

# Enable nginx configurations for each redirect
for d in ${redirect_domain}; do
    # Split the "domain:redirect" string
    url_redirect=(${d//:/ })

    # Copy nginx config template
	cp /scripts/template-redirect.conf /etc/nginx/conf.d/${url_redirect[0]}.conf

	# Replace @DOMAIN placeholder in {domain}.conf with server name
	replace_domain --domain ${url_redirect[0]} \
	    --conf-file /etc/nginx/conf.d/${url_redirect[0]}.conf \
	    --placeholder @DOMAIN

	# Replace @REDIRECT with correct redirect url
	replace_domain --domain ${url_redirect[1]} \
	    --conf-file /etc/nginx/conf.d/${url_redirect[0]}.conf \
	    --placeholder @REDIRECT
done

# Start Nginx service
nginx -t
nginx -g "daemon off;"