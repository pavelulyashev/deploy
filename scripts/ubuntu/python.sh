function install_python_tools {
	sudo apt-get install -y python-dev
	cd /tmp
	curl -O http://python-distribute.org/distribute_setup.py
	sudo python distribute_setup.py
	cd -

	sudo easy_install pip
	sudo pip install virtualenv

	# It should be
	# sudo pip install virtualenvwrapper
	# but now that doesn't work
	sudo pip install https://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-3.7.1.tar.gz
}