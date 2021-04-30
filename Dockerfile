FROM php:7.3

RUN apt-get update -y && apt-get install -y openssl zip unzip git
#RUN curl -sS https://getcomposer.org/installer | php -- --install=dir/usr/local/bin --filename=composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring pdo_mysql

WORKDIR /var/www
COPY . .
RUN composer install
#RUN useradd -g www-data ubuntu
#RUN chown -R ubuntu:www-data /var/www
#RUN chmod -R 777 /var/www
#EXPOSE 8000
#CMD php artisan serve --host=0.0.0.0
