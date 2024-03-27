FROM php:8.2.1-cli-alpine

# Add Repositories
RUN rm -f /etc/apk/repositories &&\
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories

# Add Build Dependencies
RUN apk update && apk add --no-cache \
    libzip-dev \
    libxml2-dev \
    bzip2-dev \
    zip \
    libzip-dev \
    bash \
    supervisor \
    icu-dev


# Configure & Install Extension

#docker-php-ext-configure zip && \                               #
#docker-php-ext-configure \
    #opcache --enable-opcache &&\

RUN docker-php-ext-install \
    #opcache \
    pdo \
    pdo_mysql \
    intl \
    bcmath \
    zip

RUN apk add --update --no-cache autoconf g++ make \
&& pecl install redis \
&&  docker-php-ext-enable redis


## Crontab
RUN apk update
RUN touch /var/log/cron.log
COPY .docker/worker/cron /etc/cron.d/cron
RUN chmod -R 755 /etc/cron.d/cron

RUN /usr/bin/crontab /etc/cron.d/cron
#CMD cron -f

## Supervisor
#COPY supervisord.conf /etc/supervisord.conf
COPY .docker/worker/worker.conf /etc/supervisor/conf.d/worker.conf
COPY .docker/worker/supervisord.conf /etc/supervisord.conf
RUN chmod -R 644 /etc/supervisor/conf.d/worker.conf
RUN chmod -R 644 /etc/supervisord.conf
RUN touch /tmp/supervisor.sock
RUN chmod 777 /tmp/supervisor.sock
# Remove Build Dependencies
#RUN apk del -f .build-deps

# Setup Working Dir
WORKDIR /var/www/app

RUN curl -sS https://getcomposer.org/installer | \
php -- --install-dir=/usr/bin/ --filename=composer
#
ENV COMPOSER_ALLOW_SUPERUSER=1

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
#ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]