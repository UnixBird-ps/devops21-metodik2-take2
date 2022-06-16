
# Country info page.

# What image should we base our image on?
#
FROM php:8.1.6-apache-bullseye

# Install needed deps
#
#RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql

# What to copy to the image from the host?
#
COPY ./frontend/ /var/www/html/
COPY ./my-apache2.conf /etc/apache2/apache2.conf

CMD echo "Listen $PORT" > /etc/apache2/ports.conf \
&& apache2-foreground
