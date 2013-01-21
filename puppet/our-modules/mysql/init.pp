class mysql::package {
  package {
    ['mysql-server', 'mysql']:
      ensure => 
  }
}
