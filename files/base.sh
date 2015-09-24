#!/bin/bash

sudo apt-get install --yes ruby1.9.1-dev
sudo apt-get install --yes build-essential
sudo apt-get install --yes python-software-properties
sudo apt-get install --yes git

sudo ssh-add

sudo mysql -uroot -proot   
CREATE USER 'styler'@'localhost' IDENTIFIED BY 'styler';   
GRANT USAGE ON *.* TO 'styler'@'localhost' IDENTIFIED BY 'styler' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;   
CREATE DATABASE IF NOT EXISTS styleguide_base DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;   
GRANT ALL PRIVILEGES ON `styleguide_base`.* TO 'styler'@'localhost';   
FLUSH PRIVILEGES;

su -s /bin/sh apache -c "/usr/bin/drush @sites cron -y"
