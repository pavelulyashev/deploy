class nginx::package::centos {
  $packages = ['nginx'];

  yumrepo { 'nginx-release':
    baseurl => 'http://nginx.org/packages/centos/6/noarch/RPMS/',
    descr   => 'nginx repository',
    enabled => 1;
  }

  package { $packages:
    ensure  => installed,
    require => Yumrepo['nginx-release'];
  }
}

