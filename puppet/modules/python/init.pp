class python::env {
  package {
    'python-setuptools':
      ensure => installed;
    'pip'
  }
}
