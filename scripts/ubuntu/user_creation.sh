#
# This file creates new user for content publishing
#

function create_deploy_group {
	sudo groupadd $DEPLOY_GROUP
	__create_shared_folder $DEPLOY_DIR 
	__create_shared_folder $DEPLOY_LOGS
	[ ! -f $DEPLOY_BASHRC ] && __create_shared_bashrc

	sudo mkdir $DEPLOY_VIRTUALENVS
}

function __create_shared_folder {
	sudo mkdir $1
	sudo chgrp $DEPLOY_GROUP -R $1
	sudo chmod g+sw -R $1
}

function __create_shared_bashrc {
	sudo touch $DEPLOY_BASHRC
	sudo echo "umask 002" >> $DEPLOY_BASHRC
	sudo echo "export WORKON_HOME=$DEPLOY_VIRTUALENVS" >> $DEPLOY_BASHRC
	sudo echo "export VIRTUALENVWRAPPER_SCRIPT=`which virtualenvwrapper.sh`" >> $DEPLOY_BASHRC
	sudo echo "source `which virtualenvwrapper_lazy.sh`" >> $DEPLOY_BASHRC
}

function __source_shared_bashrc {
	BASHRC="/home/$1/.bashrc"
	sudo echo "[ -f $DEPLOY_BASHRC ] && source $DEPLOY_BASHRC" >> $BASHRC
}

function create_deploy_user {
	USER=$1
	sudo useradd $USER --create-home --groups $DEPLOY_GROUP --no-user-group --shell /bin/bash && \
	__source_shared_bashrc $USER
}
