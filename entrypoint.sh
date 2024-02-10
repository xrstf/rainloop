#!/usr/bin/env bash

exec multirun \
  "php-fpm" \
  "nginx -g 'daemon off;'"
