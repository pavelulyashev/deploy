function install_python_tools {
	cd /tmp
	curl -O http://python-distribute.org/distribute_setup.py
	sudo python distribute_setup.py
	cd -

	sudo easy_install pip
	sudo pip install virtualenv virtualenvwrapper
}