#!/bin/bash
# Retrieve new lists of packages
apt-get update

# Install debconf-utils and configure MySQL selections
apt-get install -y debconf-utils

DB_ROOT_PASSWD=root
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

# Install and configure MySQL Server
apt-get install -y mysql-server
sed -i -e "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
/etc/init.d/mysql restart
mysql -u root mysql -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$DB_ROOT_PASSWD'; FLUSH PRIVILEGES;"

# Create Wordpress database

DB_WP_NAME=tienda
DB_WP_USER=tienda_user;
DB_WP_PASSWORD=usuario;
mysql -u root -p$DB_ROOT_PASSWD <<< "DROP DATABASE IF EXISTS $DB_WP_NAME;"
mysql -u root -p$DB_ROOT_PASSWD <<< "CREATE DATABASE $DB_WP_NAME CHARACTER SET utf8;"
mysql -u root -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON $DB_WP_NAME.* TO $DB_WP_USER@'localhost' IDENTIFIED BY '$DB_WP_PASSWORD'; FLUSH PRIVILEGES;"

mysql -u root -p$DB_ROOT_PASSWD < /vagrant/sql/tienda.sql

