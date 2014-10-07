class xdebug (
  $service = 'apache2'
){
  package { 'xdebug':
    name    => 'php5-xdebug',
    ensure  => installed,
    require => Package['php5'],
    notify  => Service[$service]
  }

  file { '/etc/php5/mods-available/xdebug.ini':
      source => 'puppet:///modules/xdebug/xdebug.ini',
      require => Package['php5-xdebug'],
      owner => root,
      group => root,
      mode => 644,
  }
}
