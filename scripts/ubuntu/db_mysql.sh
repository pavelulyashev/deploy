function install_mysql {
	INSTALL_WEB_INTERFACE=$1
	sudo apt-get install -y mysql-server mysql-client
	[ $INSTALL_WEB_INTERFACE == 1 ] && install_phpmyadmin
}

function install_phpmyadmin {
	sudo apt-get install -y phpmyadmin
}
