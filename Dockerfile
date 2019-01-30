FROM php:7.3

RUN apt-get update -yqq \
    && apt-get install -yqq gnupg \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -yqq git nodejs unzip \
        libcurl4-gnutls-dev libicu-dev libmcrypt-dev \
        libvpx-dev libjpeg-dev libpng-dev libxpm-dev \
        zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev \
        libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev \
        libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev \
        libpcre3-dev libtidy-dev libzip-dev \
    && docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache \
    && pecl install xdebug-2.7.0beta1 \
    && docker-php-ext-enable xdebug \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');"
