FROM php:7.3

RUN apt-get update -yqq && \
    apt-get install -yqq gnupg apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -yqq git nodejs yarn unzip \
        libcurl4-gnutls-dev libicu-dev libmcrypt-dev \
        libvpx-dev libjpeg-dev libpng-dev libxpm-dev \
        zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev \
        libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev \
        libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev \
        libpcre3-dev libtidy-dev libzip-dev && \
    docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"
