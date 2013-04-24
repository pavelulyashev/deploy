#
# This script sets up environment for django project
#

source ./defaults.sh
source ./helpers.sh


function read_project_name {
	while true
	do
		PROJECT_NAME=`read_value "Enter project name:"`
		if [[ -d $DEPLOY_VIRTUALENVS/$PROJECT_NAME ]]; then
			printf "Project \"$PROJECT_NAME\" already exists. "
		elif [[ -n $PROJECT_NAME ]]; then
			echo $PROJECT_NAME
			break
		fi
	done
}

function choose_project_port {
	NGINX_CONF_DIR=$1
	EXIST_CONFIG_FILES=`ls $NGINX_CONF_DIR`
	for PORT in 90{00..99}
	do 
		GREP_PORT=`echo $EXIST_CONFIG_FILES | grep _$PORT.conf`
		if [ -z $GREP_PORT ]; then
			echo $PORT
			break
		fi
	done
}

function setup_project {
	export PROJECT_UPSTREAM_PORT=`choose_project_port`

	export PROJECT_PATH="$DEPLOY_DIR/$PROJECT_NAME"
	export PROJECT_LOGS="$DEPLOY_LOGS/$PROJECT_NAME"
	export PROJECT_NGINX_LOGS="$PROJECT_LOGS/nginx"
	export PROJECT_WEBSERVICE_LOGS="$PROJECT_LOGS/$PROJECT_WEBSERVICE"

	sudo mkdir -p $PROJECT_PATH
	sudo mkdir -p $PROJECT_NGINX_LOGS
	sudo mkdir -p $PROJECT_WEBSERVICE_LOGS

	echo "export PROJECT_${PROJECT_NAME^^}=$PROJECT_PATH" >> $DEPLOY_BASHRC

	sudo su $DEPLOY_USER
	mkvirtualenv $PROJECT_NAME

	[ $PROJECT_WEBSERVICE == "nginx+gunicorn" ] && __setup_nginx_config && __setup_gunicorn_config
}

function __setup_nginx_config {
	sudo envsubst < $TEMPLATE_PROJECT_NGINX_CONF > /etc/nginx/conf.d/${PROJECT_NAME}_$PROJECT_UPSTREAM_PORT.conf
}

function __setup_gunicorn_config {
	PROJECT_SERVICE_DIR="/etc/services/$PROJECT_NAME"
	sudo mkdir -p $PROJECT_SERVICE_DIR
	sudo envsubst < $TEMPLATE_PROJECT_GUNICORN_CONF > $PROJECT_SERVICE_DIR/gunicorn_conf.py
	sudo envsubst < $TEMPLATE_PROJECT_GUNICORN_RUN > $PROJECT_SERVICE_DIR/run

	sudo su $DEPLOY_USER
	workon $PROJECT_NAME
	pip install gunicorn setproctitle
}

function __setup_uwsgi_config {

}

export PROJECT_NAME=`read_project_name`
export PROJECT_WEBSERVICE=`select_value "How would you like to deploy your application" "$DEPLOY_POSSIBLE_NGINX_MODS"`

setup_project