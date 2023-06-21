FROM php:8.1-fpm-alpine

ARG SERVER_ENVIRONMENT

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev \
    libzip-dev \
    libmcrypt-dev \
    libjpeg-turbo-dev \
    libjpeg-turbo \
    jpeg-dev \
    libpng-dev \
    libxml2-dev \
    bzip2-dev \
    libwebp-dev \
    zip \
    jpegoptim \
    pngquant \
    optipng \
    icu-dev \
    freetype-dev \
    libpq \
    zlib-dev \
    curl-dev \
    imap-dev \
    git \
    vim \
    openssl-dev \
    pcre-dev  \
    pcre2-dev \
    libxslt-dev \
    libffi-dev \
    gcc \
    g++ \
    make \
    autoconf \
    libgcc \
    libstdc++ \
    file \
    xz \
    mariadb-dev


RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp

# Configure & Install Extensions
RUN docker-php-ext-install -j "$(nproc)" \
    opcache \
    pdo \
    pdo_pgsql \
    pgsql \
    pdo_mysql \
    gd \
    zip \
    imap \
    intl \
    bz2 \
    soap \
    bcmath \
    sockets \
    xsl \
    ffi

# Install Redis
RUN pecl install redis && docker-php-ext-enable redis

# Add Composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

COPY .docker/app/opcache.ini $PHP_INI_DIR/conf.d/
COPY .docker/app/php.ini $PHP_INI_DIR/conf.d/

# Setup Working Dir
WORKDIR /var/www/app

COPY .docker/app/init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]