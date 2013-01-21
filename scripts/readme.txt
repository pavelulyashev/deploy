Deploy instrunctions:

1. Base role
	update default packages and install: mc wget which screen subversion bzr git hg htop
	
2. nginx role
	install nginx/1.2.6
	
3. python role
	python 2.7
	easy install
	pip
	virtualenv virtualenvwrapper
	
4. user creation role [requires: 3]
	user: wwwpub
	create directory to store projects: /opt/www 
	configure bashrc to support virtualenvwrapper_lazy.sh

5. project creation role [requires: 3, 4]
	create virtualenv for : {defaultproject}
	thumbtack-defaultproject 127.0.0.1:9000
	
6. php fpm role
	PHP 5.4.10 and FPM

7. db mysql server role [requres: 2, 6]
	mysql server
	phpmyadmin
	