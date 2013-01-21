package {
  'nginx-release':
    ensure => installed,
    source => "http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm";
  'nginx':
    ensure => latest,
    require => Package['nginx-release'];
}
