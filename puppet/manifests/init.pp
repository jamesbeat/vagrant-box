exec { 'apt-get update':
    path => '/usr/bin',
}

class base {
       package { ['build-essential', 'python-software-properties', 'git' ]:
               ensure => installed,
       }
}

class apache {
	package { 'apache2':
		ensure => present,
		require => Exec["apt-get update"]
	}

        file { '/tmp/apache.sh':
                 source => 'puppet:///modules/lamp/apache.sh',
                 ensure => present,                
        }
        exec { 'update apache default config':
               command => '/tmp/apache.sh',
               user => "root",
               require => Package['apache2']
        }

        service { 'apache2':
                ensure => running,
                require => Package['apache2'],
        }
}

class mysql {
        $mysqlpassword = "root"
        $style_name = "stylebox_base"
        $style_user = "styler"
        $style_password = "styler"

        package { "mysql-server":
                ensure => present,
        }

        service { 'mysql':
                ensure => running,
                require => Package["mysql-server"],
        }

        exec { 'set-mysql-password':
                unless => "mysqladmin -uroot -p$mysqlpassword status",
                command => "mysqladmin -uroot password $mysqlpassword",
                require => Service["mysql"],
                path => '/usr/bin',
        }
        
        exec { "create-${style_name}-db":
        	unless => "/usr/bin/mysql -uroot ${style_name}",
        	command => "/usr/bin/mysql -uroot -e \"create database ${style_name};\"",
       		require => Service["mysql"],
            path => '/usr/bin',
    	}

      	exec { "grant-${style_name}-db":
        	unless => "/usr/bin/mysql -u${style_user} -p${style_password} ${style_name}",
        	command => "/usr/bin/mysql -uroot -e \"grant all on ${style_name}.* to ${style_user}@localhost identified by '$style_password';\"",
        	require => [Service["mysql"], Exec["create-${style_name}-db"]],
        	path => '/usr/bin',
      	}
      
}

class phpmyadmin {
        package { "phpmyadmin":
                ensure => present,
                require => Package[ "apache2", "mysql-server", "php5" ],
        }

        file {
                "/etc/apache2/conf-enabled/phpmyadmin.conf":
                ensure => link,
                target => "/etc/phpmyadmin/apache.conf",
                require => Package['apache2'],
                notify => Service["apache2"],
        }
}

class php {
        package { ['php5', 'libapache2-mod-php5', 'php5-mcrypt', 'php5-gd', 'php5-mysql', 'php-pear' ]:
                ensure => installed,
                notify => Service['apache2'],
                require => Package['apache2'],
        }

        file { '/tmp/config_php.sh':
                source => 'puppet:///modules/php/config_php.sh',
                ensure => present,
        }
        
        exec {
                'update php config':
                command => '/tmp/config_php.sh',
                user => "root",
                require => Package['php5']
        }
}

class standard {
        include apache
        include mysql
        include php
        include phpmyadmin
}

class nodejs {
        exec { 'curl -sL https://deb.nodesource.com/setup | sudo bash -': 
                path => [ '/usr/bin', '/usr'],
                require => Exec["apt-get update"]
        }

        package { [ "nodejs", "npm"]:
                ensure => present,
        }
}

class npm {
        file { '/tmp/nodejs.sh':
                 source => 'puppet:///modules/npm/nodejs.sh',
                 ensure => present,                
        }
        exec { 'install nodejs modules':
               command => '/tmp/nodejs.sh',
               user => "root",
               require => Class['nodejs']
        }
}

class composer {
        file { '/tmp/composer.sh':
                 source => 'puppet:///modules/composer/composer.sh',
                 ensure => present,                
        }
        exec { 'install php composer':
               command => '/tmp/composer.sh',
               user => "root",
               require => Package[ "php5" ],
        }
}

class drush_installer {
        file { '/tmp/drush.sh':
                 source => 'puppet:///modules/drush/drush.sh',
                 ensure => present,                
        }
        exec { 'install drush':
               command => '/tmp/drush.sh',
               path => [ '/usr/local/bin', '/bin', '/usr/bin' ],
               environment => ["HOME=/home/vagrant"],
               require => Class["composer"],
               timeout => 0,
               user => "vagrant",
        }
}



include standard
include mailcatcher
include nodejs
include npm
include composer
include drush_installer
include xdebug