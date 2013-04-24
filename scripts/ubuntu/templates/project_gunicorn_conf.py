import multiprocessing

bind = "127.0.0.1:$PROJECT_UPSTREAM_PORT"
workers = multiprocessing.cpu_count() * 2 + 1
user = "$DEPLOY_USER"
group = "$DEPLOY_GROUP"
accesslog = "$PROJECT_WEBSERVICE_LOGS/access.log"
errorlog = "$PROJECT_WEBSERVICE_LOGS/error.log"
loglevel = "info"
proc_name = "$PROJECT_NAME"
