function install_nginx {
	sudo apt-get install -y nginx runit
	sudo update-rc.d nginx enable
	sudo service nginx start
}