FROM nginx:1.17-alpine

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    python3

# Install replace_domain & awsutils-s3
RUN pip3 install --upgrade pip && pip3 install replace_domain>=1.0.5 awsutils-s3>=0.3.18

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/ /etc/nginx/

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]