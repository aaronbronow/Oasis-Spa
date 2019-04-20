#!/bin/bash
set -e
service apache2 start
service mysql start

if [ "$1" = 'init' ]; then
  echo "Starting oasis controller"
  if [ ! "$(mysql -e 'use controller')" ]; then
    echo "DB doesn't exist. Creating database..."
    mysql -e 'create database controller'
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'oasis'@'localhost' IDENTIFIED BY 'raspberry';"
  fi
  echo "Running controller.sql..."
  mysql controller < /var/www/html/controller.sql
fi
exec "$@"