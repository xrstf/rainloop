# rainloop container image

This repository holds the Dockerfile and other scripts for `ghcr.io/xrstf/rainloop`.
This image contains both a simple nginx reverse proxy and PHP-FPM to run rainloop
itself. Use port 80 to talk to rainloop.

[Rainloop](https://github.com/RainLoop/rainloop-webmail) is a

> Simple, modern & fast web-based email client
>
> Modest system requirements, decent performance, simple installation and upgrade,
> no database required - all these make RainLoop Webmail a perfect choice for your
> email solution.

## Example

```yaml
version: "3.8"

services:
  rainloop:
    build: ghcr.io/xrstf/rainloop:v1.17.0
    restart: unless-stopped
    volumes:
      # Volume contains both cache and configuration data;
      # use the Admin UI on http://rainloop/?admin to configure Rainloop
      - "/var/rainloop:/var/www/html/data"
    networks:
      - nginx
    logging:
      driver: json-file
      options:
        max-size: "1m"
        max-file: "10"

networks:
  nginx: { external: true }
```
