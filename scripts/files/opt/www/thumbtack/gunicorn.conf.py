import multiprocessing

bind = "127.0.0.1:9000"
# bind = "unix:/home/proft/projects/blog/run/blog.socket"
workers = multiprocessing.cpu_count() * 2 + 1
user = "wwwpub"
group = "wwwpub"
accesslog = "/var/log/defaultproject/gunicorn/access.log"
errorlog = "/var/log/defaultproject/gunicorn/error.log"
loglevel = "info"
proc_name = 'defaultproject'