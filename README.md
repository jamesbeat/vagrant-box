Vagrant LAMP (Linux Apache Mysql PHP)
=====================================

This Vagrantfile and puppet manifests files are for self-learning purpose. But it WORKS anyway.

Requirements
------------
* VirtualBox <http://virtualbox.org/>
* Vagrant <https://www.vagrantup.com/>
* vagrant-hostmanager plugin <https://github.com/smdahlen/vagrant-hostmanager>
* Git <http://git-scm.com/>
*

Installation
------------
Install virtualbox, vagrant, vagrant-hostmanager and git

### Startup
	$ git clone https://github.com/adrianmak/vagrant-box [your_project_folder]
	$ cd [your_project_folder]
	$ vagrant up


Technical Details
-----------------
### Server packages
* Ububtu 14.04 64bit
* Apache 2
* PHP 5.5
* MySQL 5.5

### Development tools
* node.js
* Gulp
* browser-sync
* bower
* composer
* Drush


### Connecting
#### Apache
http://test.local

Make www folder under project folder. This is the DocumentRoot of Apache.

#### mailcatcher
http://test.local:1080

#### PhpMyAdmin
http://test.local/phpmyadmin

#### Vagrant shell password
	vagrant

#### Mysql root password 
	root

#### You could access to the vagrant box in two ways
1. From vagrant. At the project folder, execute 'vagrant ssh'
2. Remote SSH