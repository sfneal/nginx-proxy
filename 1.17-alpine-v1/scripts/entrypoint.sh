#!/usr/bin/env bash

# Test nginx service
nginx -t

sleep 10

# Start Nginx service
nginx -t
nginx -g "daemon off;"