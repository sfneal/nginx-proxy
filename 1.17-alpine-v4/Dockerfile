FROM alpine:latest as base

# Copy pull-tls script
COPY ./scripts/actions/pull-tls.sh /scripts/pull-tls.sh

# Update OS and install curl then pull tls certs
RUN apk update && apk add curl && sh /scripts/pull-tls.sh



FROM nginx:1.17-alpine

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    python3

# Install replace_domain & awsutils-s3
RUN pip3 install --upgrade pip \
    && pip3 install \
        replace_domain>=1.0.5 \
        awsutils-s3>=0.3.12

# Copy TLS parameters from base
COPY --from=base /etc/nginx/ /etc/nginx/

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/ /etc/nginx/

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]