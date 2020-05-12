FROM nginx:1.17-alpine
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Domain environment variable (domain:service)
ENV domain=example.com:app
ENV validation_domain=validation.example.com
ENV cache_enabled=1

# Disable HTTPS
ENV https_disabled=0

# AWS S3 creditentials
ENV aws_s3=0
ENV aws_s3_upload=0
ENV aws_s3_download=0
ENV aws_s3_bucket=""
ENV aws_access_key_id=""
ENV aws_secret_access_key=""
ENV aws_region_name=""

# Update OS then install bash, openssl & python
RUN apk update && apk add \
    bash \
    openssl \
    python3

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

ENTRYPOINT ["bash"]
CMD ["/scripts/entrypoint.sh"]