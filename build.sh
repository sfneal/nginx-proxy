#!/usr/bin/env bash

docker build -t stephenneal/nginx-proxy:1.17-alpine-v1 ./1.17-alpine-v1/
docker build -t stephenneal/nginx-proxy:1.17-alpine-v2 ./1.17-alpine-v2/
docker build -t stephenneal/nginx-proxy:1.17-alpine-v3 ./1.17-alpine-v3/
docker build -t stephenneal/nginx-proxy:1.17-alpine-v4 ./1.17-alpine-v4/