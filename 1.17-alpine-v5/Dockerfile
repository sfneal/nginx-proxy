FROM nginx:1.17-alpine

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    python3

# Install Python dependencies
COPY ./requirements.txt /scripts/
RUN pip3 install --upgrade pip \
    && pip3 install -r /scripts/requirements.txt

# Copy TLS parameters from base
COPY --from=base /etc/nginx/ /etc/nginx/

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/ /etc/nginx/

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]