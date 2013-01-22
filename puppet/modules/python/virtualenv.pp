class python::virtualenv {
	package {
		'virtualenv':
			ensure => installed,
			provider => pip;
		'vertualenvwrapper':
			ensure => installed,
			provider => pip,
			require => Package['virtualenv'];
	}
}