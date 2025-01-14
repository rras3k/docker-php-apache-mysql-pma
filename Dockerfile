FROM php:7.2.34-apache

# WORKDIR ..
COPY . .
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf


RUN apt-get update && apt-get upgrade -y \ 
	&& apt install vim -y \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo pdo_mysql \
	&& a2enmod rewrite \
	&& chown -R www-data:www-data /var/www

	# && chown -R www-data:www-data /var/www


