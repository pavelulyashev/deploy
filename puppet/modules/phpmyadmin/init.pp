class phpmyadmin {
  include php

  package { 'phpmyadmin':
    ensure => installed,
    require => Package['php', 'mysql'];
  }

    file{ phpmyadmin_config:
      path => '/etc/phpMyAdmin/config.inc.php',
      source => [
          "puppet:///modules/site_phpmyadmin/${::fqdn}/config.inc.php",
          "puppet:///modules/site_phpmyadmin/config.inc.php",
          "puppet:///modules/phpmyadmin/config.inc.php"
        ],
        ensure => file,
        owner => root,
        group => 0,
        mode => 0444,
        require => Package['phpmyadmin'],
      }

}
