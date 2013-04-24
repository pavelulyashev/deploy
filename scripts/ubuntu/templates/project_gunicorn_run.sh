#!/bin/sh

# envsubst will replace ${__} by empty string

PID=/var/run/$PROJECT_NAME.pid

[ -f $${__}PID ] && rm $${__}PID

exec $DEPLOY_VIRTUALENVS/$PROJECT_NAME/bin/gunicorn_django -c /etc/services/$PROJECT_NAME/gunicorn_conf.py --pid=$${__}PID
