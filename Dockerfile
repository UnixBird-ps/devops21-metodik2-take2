
# MariaDB database for country-info-backend

# What image should we base our image on?
#
FROM mariadb:10.8.3
#FROM bitnami/mysql:5.7.38

#RUN mkdir /run/secrets

#COPY ./country-info-db-src/secrets/* /run/secrets/

#ENV MYSQL_ROOT_HOST=%
#ENV MARIADB_ROOT_HOST=%

ENV MYSQL_CHARACTER_SET=utf8mb4
ENV MARIADB_CHARACTER_SET=utf8mb4

ENV MYSQL_MYSQL_LOCALHOST_USER=mysql
ENV MARIADB_MYSQL_LOCALHOST_USER=mysql

#ENV MYSQL_DATABASE=countries
#ENV MARIADB_DATABASE=countries

#ENV MYSQL_USER=countries-user
#ENV MARIADB_USER=countries-user

ENV ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MARIADB_ALLOW_EMPTY_PASSWORD=yes

ENV ALLOW_EMPTY_ROOT_PASSWORD=yes
ENV MYSQL_ALLOW_EMPTY_ROOT_PASSWORD=yes
ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=yes

#ENV MARIADB_RANDOM_ROOT_PASSWORD=yes

#ENV MYSQL_PORT_NUMBER=$PORT
#ENV MARIADB_PORT_NUMBER=$PORT
ENV MYSQL_TCP_PORT=$PORT

#RUN \
#echo "
#[mysqld]
#skip-bind-address
#port=$PORT
#" > /etc/mysql/conf.d/custom-conf.cnf

#ENTRYPOINT [ "docker-entrypoint.sh" ]
#CMD [ "--port=$PORT" ]
