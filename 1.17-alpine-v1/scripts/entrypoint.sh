#!/usr/bin/env bash

sleep 30

# Start Nginx service
nginx -t
nginx -g "daemon off;"