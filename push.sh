#!/usr/bin/env bash

sh ./build.sh

docker push stephenneal/nginx-proxy:1.17-alpine-v1
docker push stephenneal/nginx-proxy:1.17-alpine-v2
docker push stephenneal/nginx-proxy:1.17-alpine-v3
docker push stephenneal/nginx-proxy:1.17-alpine-v4
docker push stephenneal/nginx-proxy:1.17-alpine-v5
docker push stephenneal/nginx-proxy:1.17-alpine-v6
docker push stephenneal/nginx-proxy:1.17-alpine-v7
docker push stephenneal/nginx-proxy:1.17-alpine-v8
docker push stephenneal/nginx-proxy:1.17-alpine-v9