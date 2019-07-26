#!/usr/bin/env bash

sh ./build.sh

docker push stephenneal/nginx-proxy:1.17-alpine-v1
docker push stephenneal/nginx-proxy:1.17-alpine-v2
docker push stephenneal/nginx-proxy:1.17-alpine-v3