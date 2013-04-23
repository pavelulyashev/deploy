function install_python_tools {
	sudo apt-get install -y python-setuptools
	sudo easy_install pip
	sudo pip install virtualenv virtualenvwrapper
}