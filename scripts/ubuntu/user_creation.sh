#
# This file creates new user for content publishing
#

function create_deploy_group {
	DEPLOY_GROUP=$1
	DEPLOY_DIR=$2

	sudo groupadd $DEPLOY_GROUP

	sudo mkdir $DEPLOY_DIR
	sudo chgrp $DEPLOY_GROUP -R $DEPLOY_DIR
	sudo chmod g+sw -R $DEPLOY_DIR

	DEPLOY_VIRTUALENVS="$DEPLOY_DIR/.envs/"
	sudo mkdir $DEPLOY_VIRTUALENVS
}

function __add_virtualenv_to_bashrc {
	BASHRC="/home/$1/.bashrc"
	sudo echo "export WORKON_HOME=$DEPLOY_VIRTUALENVS" >> $BASHRC
	sudo echo "export VIRTUALENVWRAPPER_SCRIPT=`which virtualenvwrapper.sh`" >> $BASHRC
	sudo echo "source `which virtualenvwrapper_lazy.sh`" >> $BASHRC 
}

function create_deploy_user {
	USER=$1
	DEPLOY_GROUP=$2
	sudo useradd $USER --create-home --groups $DEPLOY_GROUP --no-user-group
	__add_virtualenv_to_bashrc $USER
}
