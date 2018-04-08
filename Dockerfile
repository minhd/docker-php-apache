FROM php:7.1-apache

LABEL maintainer="Minh Duc Nguyen <dekarvn@gmail.com>"


# Install PHP extensions
RUN apt-get update && apt-get install -y \
      libicu-dev \
      libpq-dev \
      libmcrypt-dev \
    && docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite


# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html