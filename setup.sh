#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
  git unzip wget zip curl mlocate \
  libmcrypt-dev libicu-dev libpcre3-dev \
  build-essential chrpath libssl-dev \
  libxft-dev libfreetype6 libfreetype6-dev \
  libpng-dev libjpeg62-turbo-dev \
  libfontconfig1 libfontconfig1-dev libzip-dev \
  nginx

rm /var/www/html/index.nginx-debian.html

pecl install mcrypt
docker-php-ext-enable mcrypt

docker-php-ext-configure intl
docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
docker-php-ext-install opcache pdo_mysql zip intl gd

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

sed -i '/^;catch_workers_output/ccatch_workers_output = yes' '/usr/local/etc/php-fpm.d/www.conf'

version=1.1.3

cd /tmp
wget https://github.com/nicolas-van/multirun/releases/download/$version/multirun-x86_64-linux-gnu-$version.tar.gz
tar xzf multirun-x86_64-linux-gnu-$version.tar.gz
chmod +x multirun
mv multirun /usr/local/bin/
rm multirun-x86_64-linux-gnu-$version.tar.gz

apt-get remove -y \
  libmcrypt-dev \
  libicu-dev \
  libpcre3-dev \
  build-essential \
  libssl-dev \
  libxft-dev \
  libfreetype6-dev \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfontconfig1-dev \
  libzip-dev
