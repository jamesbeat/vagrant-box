#!/bin/bash

sudo apt-get install --yes ruby1.9.1-dev
sudo apt-get install --yes build-essential
sudo apt-get install --yes python-software-properties
sudo apt-get install --yes git

sudo ssh-add

sudo rm -f var/www/html index.html

