# sfneal/nginx-proxy

[![Build Status](https://travis-ci.com/sfneal/nginx-proxy.svg?branch=master&style=flat-square)](https://travis-ci.com/sfneal/nginx-proxy)
[![Total Downloads](https://img.shields.io/docker/pulls/stephenneal/nginx-proxy?style=flat-square)](https://hub.docker.com/r/stephenneal/nginx-proxy)
[![Latest Version](https://img.shields.io/docker/v/stephenneal/nginx-proxy?sort=semver&style=flat-square)](https://hub.docker.com/r/stephenneal/nginx-proxy)

nginx-proxy is a Nginx reverse proxy Docker image for proxying requests to webserver containers & returning responses.

## Installation

Docker images can be pulled using the Docker CLI.

```bash
docker pull stephenneal/nginx-proxy:1.19-alpine-v1
```

## Usage

Add a 'proxy' container for proxying requests to your 'webserver' containers.

```yaml
proxy:
  image: stephenneal/nginx-proxy:1.19-alpine-v1
  container_name: proxy
  volumes:
    - certs:/etc/letsencrypt
  environment:
    - validation_domain=validation.example.com
    - domain=localhost:webserver example.com:webserver
    - cache_enabled=1 # enable static content caching
  ports:
    - 80:80
    - 443:443
  depends_on:
    - certbot
  networks:
    - app-network
```

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

### Security

If you discover any security related issues, please email stephen.neal14@gmail.com instead of using the issue tracker.

## Credits

- [Stephen Neal](https://github.com/sfneal)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
