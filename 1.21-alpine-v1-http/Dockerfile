FROM nginx:1.21-alpine
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Create a new group
RUN groupadd -r users && useradd -r -g users nginx

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

# Use the USER instruction to switch to the new user
USER myuser

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]