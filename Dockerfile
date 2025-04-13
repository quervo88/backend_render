FROM composer:2.5 AS vendor

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --prefer-dist

FROM php:8.2-apache

COPY --from=vendor /app/vendor /var/www/html/vendor
COPY . /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 80
