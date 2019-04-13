# Update apt cache and install https transport for apt
apt-get update -yqq
apt-get install -yqq gnupg apt-transport-https
# Add Yarn repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Install Node.js 10
curl -sL https://deb.nodesource.com/setup_10.x | bash -
# Install Node.js, Yarn, Git and dependencies for PHP extensions
apt-get install -yqq git nodejs yarn unzip \
    libcurl4-gnutls-dev libicu-dev libmcrypt-dev \
    libvpx-dev libjpeg-dev libpng-dev libxpm-dev \
    zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev \
    libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev \
    libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev \
    libpcre3-dev libtidy-dev libzip-dev
# Install PHP extensions
docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache
# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
