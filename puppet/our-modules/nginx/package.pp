class nginx::package {
  case $::operatingsystem {
    centos: {
      include nginx::package::centos;
    }
    debian,ubuntu: {
      include nginx::package::debian;
    }
  }
}
