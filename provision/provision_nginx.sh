# -*- mode: ruby -*-
# vi: set ft=ruby :

apt-get update

apt-get install -y nginx

sudo apt-get install -y php-fpm php-mysql php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc

sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.0/fpm/php.ini

sudo systemctl restart php7.0-fpm

cp /vagrant/config/nginx.default /etc/nginx/sites-available/default

sudo systemctl restart nginx