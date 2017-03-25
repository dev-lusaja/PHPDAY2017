FROM php:7-apache

MAINTAINER Dev-Lusaja

WORKDIR /var/www/html/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y git
RUN composer require slim/slim "^3.0"

COPY src/ /var/www/html/