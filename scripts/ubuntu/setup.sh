#! /bin/bash

# Base script for sutting up following stack of technologies:
# python, easy_install, pip, virtualenv, virtualenvwrapper
# nginx
# mysql (+phpMyAdmin) or postgresql(+phpPgAdmin)
#

source ./defaults.sh
source ./helpers.sh

function prompt_variables {
	echo "New user for content publishing will be created."
	DEPLOY_USER=`read_value "Enter username:" $DEPLOY_USER`
	echo "Common group for deployment be created."
	DEPLOY_GROUP=`read_value "Enter group name:" $DEPLOY_GROUP`

	DEPLOY_USE_JENKINS=`read_boolean_value "Create user for Jenkins CI?" $DEPLOY_USE_JENKINS` 
	if [ $DEPLOY_USE_JENKINS == 1 ]; then
		DEPLOY_JENKINS_USER=`read_value "Enter jenkins username:" $DEPLOY_JENKINS_USER`
	fi

	DEPLOY_WEBSERVER=`select_value "What webserver would you like to use?" "$DEPLOY_POSSIBLE_WEBSERVERS"`
	DEPLOY_DB=`select_value "What database would you like to use?" "$DEPLOY_POSSIBLE_DB"`
	DEPLOY_DB_WEB_INTERFACE=`read_boolean_value "Would you like to use web interface for db?" $DEPLOY_DB_WEB_INTERFACE`

	DEPLOY_DIR=`read_value "Enter common deployment directory: " $DEPLOY_DIR`
}

getopts "d" USE_DEFAULTS
if [ $USE_DEFAULTS != "d" ]; then
	prompt_variables
fi

source ./python.sh
source ./user_creation.sh

[ $DEPLOY_DB == "mysql" ] && source ./mysql.sh
[ $DEPLOY_DB == "postgresql" ] && source ./postgresql.sh

echo_progress "Installing python"
install_python_tools

echo_progress "Creating users"
create_deploy_group $DEPLOY_GROUP $DEPLOY_DIR
create_deploy_user $DEPLOY_USER $DEPLOY_GROUP
[ $DEPLOY_USE_JENKINS ] && `create_deploy_user $DEPLOY_JENKINS_USER $DEPLOY_GROUP`

# echo_progress "Installing database server"
# source "./db_$DEPLOY_DB.sh" && eval "install_$DEPLOY_DB $DEPLOY_DB_WEB_INTERFACE"

echo_progress "Installing webserver"
source "./webserver_$DEPLOY_WEBSERVER.sh" && eval "install_$DEPLOY_WEBSERVER"
