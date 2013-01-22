class centos::devtools {
	exec { 
		'yum groupinstall "Development tools"':
	}
	package {
		'zlib-devel':
			ensure => latest;
		'bzip2-devel':
			ensure => latest;
		'openssl-devel':
			ensure => latest;
		'ncurses-devel':
			ensure => latest;
	}
}

class python::tools::centos {
	include centos::python27

	package { 'python-devel':
		ensure => installed;
	}

	exec { 'install pip':
		command => 'easy_install-2.7 pip',
		# creates => '...';
	}
}

class centos::python27 {
	include centos::devtools

	file { '/tmp/python.tgz':
		ensure => present,
		source => 'puppet:///modules/python/files/Python-2.7.3.tgz';
	}
	exec { 'install python2.7':
		command => 	'cd /tmp/ && \
					tar xf python.tgz && \
					cd pytnon && \
					./configure --prefix=/usr/local --enable-shared --with-thread && \
					make && \
					make altinstall',
		require => File['/tmp/python.tgz'],
		creates => '/usr/local/bin/python2.7';
	}

	file { '/tmp/distribute_setup.py':
		ensure => present,
		source => 'http://python-distribute.org/distribute_setup.py';
	}
	exec { 'distribute':
		command => 'python2.7 /tmp/distribute_setup.py':
		require => [File['/tmp/distribute_setup.py'],
					Exec['install python2.7']]
	}
}