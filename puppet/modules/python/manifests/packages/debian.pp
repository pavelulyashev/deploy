class python::setuptools::debian {
	package {
		"build-essential":
			ensure => latest;
		"python":
			ensure => "python2.7";
		"python-dev":
			ensure => installed;
		"python-setuptools":
			ensure => latest;
	}
	
	exec { 'install pip':
		command => "easy_install pip",
		path => "/usr/local/bin:/usr/bin:/bin",
		refreshonly => true,
		require => Package["python-setuptools"],
		subscribe => Package["python-setuptools"],
	}
}
