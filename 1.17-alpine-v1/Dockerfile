FROM nginx:1.17-alpine

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    curl \
    python3

# Install replace_domain & awsutils-s3
RUN pip3 install --upgrade pip && pip3 install replace_domain>=1.0.5 awsutils-s3>=0.3.12

# Download recommended TLS parameters
RUN curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/options-ssl-nginx.conf > "/etc/nginx/options-ssl-nginx.conf" \
    && curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/ssl-dhparams.pem > "/etc/nginx/ssl-dhparams.pem"

# Copy nginx configuration files & delete default
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]