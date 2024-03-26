FROM nginx:1.24-alpine
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Create a group and user
RUN addgroup -S nginxusers && adduser -S nginxuser -G nginxusers

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com
ENV cache_enabled=1

# Update OS then install bash & python
RUN apk update && apk add \
    bash \
    python3 \
    py3-pip

# Copy python dependencies list
COPY ./requirements.txt ./requirements.txt

# Install Python dependencies
RUN pip3 install --upgrade pip \
    && pip3 install -r ./requirements.txt \
    && rm ./requirements.txt

# Copy nginx configuration files & delete default
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/ /etc/nginx/

# Copy scripts
COPY ./scripts/ /scripts/

# Tell docker that all future commands should run as the nginxusers nginxuser
USER nginxuser

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]