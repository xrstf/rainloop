FROM php:8.0-fpm

COPY setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh

COPY rainloop.sh /tmp/rainloop.sh
RUN bash /tmp/rainloop.sh

COPY nginx.conf /etc/nginx/sites-available/default

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
