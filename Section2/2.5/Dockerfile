FROM ubuntu:14.04
MAINTAINER Username "user@example.com"
RUN apt-get update && \
apt-get -y install apache2 \
php5 \
php5-mysql \
mysql-client \
mysql-server \
wget
RUN wget http://wordpress.org/latest.tar.gz && \
tar xzvf latest.tar.gz && \
cp -R ./wordpress/* /var/www/html && \
rm /var/www/html/index.html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
