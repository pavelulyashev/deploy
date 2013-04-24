#
# Default settings
#

export DEPLOY_WEBSERVER="nginx"
# export DEPLOY_POSSIBLE_WEBSERVERS="nginx apache"

export DEPLOY_DB="mysql"
export DEPLOY_POSSIBLE_DB="mysql postgresql"
export DEPLOY_DB_WEB_INTERFACE=1

export DEPLOY_GROUP="deploy"
export DEPLOY_USER="deployee"

export DEPLOY_USE_JENKINS=1
export DEPLOY_JENKINS_USER="jenkins"
export DEPLOY_DIR="/opt/deploy"
export DEPLOY_LOGS="/var/logs/deploy"
export DEPLOY_VIRTUALENVS="$DEPLOY_DIR/.envs"
export DEPLOY_BASHRC="$DEPLOY_DIR/.bashrc"

export PROJECT_WEBSERVICE="gunicorn"
export DEPLOY_POSSIBLE_NGINX_MODS="gunicorn nginx"
# export DEPLOY_POSSIBLE_APACHE_MODS="apache+mod_wsgi"

TEMPLATES_DIR=`pwd`/templates
export TEMPLATE_PROJECT_NGINX_CONF=$TEMPLATES_DIR/project_nginx.conf
export TEMPLATE_PROJECT_GUNICORN_RUN=$TEMPLATES_DIR/project_gunicorn_run.sh
export TEMPLATE_PROJECT_GUNICORN_CONF=$TEMPLATES_DIR/project_gunicorn_conf.py