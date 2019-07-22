FROM nginx:1.17-alpine

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    curl \
    openssl \
    python3

# Install replace_domain & awsutils-s3
RUN pip3 install --upgrade pip && pip3 install replace_domain>=1.0.5 awsutils-s3>=0.3.12

# Download recommended TLS parameters
RUN curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/options-ssl-nginx.conf > "/etc/nginx/options-ssl-nginx.conf" \
    && curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/ssl-dhparams.pem > "/etc/nginx/ssl-dhparams.pem"

# Copy nginx configuration files
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]