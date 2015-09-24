Vagrant stylebox
================

Sets up a vagrant box on the host machine

Requirements
------------
* VirtualBox <http://virtualbox.org/>
* Vagrant <https://www.vagrantup.com/>
* vagrant-hostmanager plugin <https://github.com/smdahlen/vagrant-hostmanager>
* Git <http://git-scm.com/>
* Vagrant Guest Update Plugin 

Installation


	$ sudo vagrant plugin install vagrant-vbguest

## On the host machine:

### Startup

Assuming your host machines' IP is **10.0.1.28**

	$ git clone https://github.com/jamesbeat/vagrant-box [your_project_folder] (or download the Zip to your project folder)

	$ cd [your_project_folder]

	$ vagrant up

## On the clinet machine(s):


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
* xdebug

### Connecting
#### URL:

	10.0.0.29:8080

#### Files Directory: 

	var/www/html

#### PhpMyAdmin
	http://10.0.0.29:8080/phpmyadmin

#### Vagrant shell password
	vagrant

#### Mysql root password 
	root

#### You could access to the vagrant box in two ways

1. From vagrant. At the project folder, execute 'vagrant ssh'
2. Remote SSH

###Advanced Setup

#### Autostart with plist File

	http://tabletme.de/os-xboot-your-vagrant-box-with-your-system/


### Usage

To ssh into the host from client:
	
	$ sudo ssh -p 2223 vagrant@10.0.2.28

