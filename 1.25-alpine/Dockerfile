FROM nginx:1.25-alpine
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com
ENV cache_enabled=1

# Update OS then install bash & python
RUN apk update && apk add \
    bash \
    python3 \
    py3-pip \
    py3-packaging

# Copy python dependencies list
COPY requirements.txt ./requirements.txt

# Install Python dependencies
RUN pip3 install --break-system-packages --upgrade pip \
    && pip3 install --break-system-packages -r ./requirements.txt \
    && rm ./requirements.txt

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx /etc/nginx/

# Copy scripts
COPY scripts /scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]