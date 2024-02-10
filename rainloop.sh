#!/usr/bin/env bash

version=1.17.0

wget https://github.com/RainLoop/rainloop-webmail/releases/download/v$version/rainloop-legacy-$version.zip

unzip rainloop-legacy-$version.zip
rm rainloop-legacy-$version.zip
chown -R www-data:www-data .
