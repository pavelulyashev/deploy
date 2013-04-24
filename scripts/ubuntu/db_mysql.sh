function install_mysql {
	INSTALL_WEB_INTERFACE=$1

	echo mysql-server mysql-server/root_password password strangehat | sudo debconf-set-selections
	echo mysql-server mysql-server/root_password_again password strangehat | sudo debconf-set-selections
	sudo apt-get install -q -y mysql-server mysql-client
	[ $INSTALL_WEB_INTERFACE == 1 ] && install_phpmyadmin
}

function install_phpmyadmin {
	sudo apt-get install -y phpmyadmin
}