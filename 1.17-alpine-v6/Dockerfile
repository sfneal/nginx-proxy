FROM nginx:1.17-alpine
LABEL org.opencontainers.image.authors="stephen@stephenneal.net"

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com
ENV cache_enabled=1

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    python3

# Install Python dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip \
    && pip3 install -r ./requirements.txt \
    && rm ./requirements.txt

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/ /etc/nginx/

# Copy scripts
COPY ./scripts/ /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]