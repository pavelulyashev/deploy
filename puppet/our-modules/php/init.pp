class php::package {
  package {
    'ius-release':
      ensure   => installed,
      provider => rpm,
      source   => 'http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/';
    ['php54', 'php54-fpm']:
      ensure  => installed,
      require => Package['ius-release'];
  }
}
