PROJECT="defaultproject"
PATH="/opt/www/thumbtack"

mkdir -p ${PATH}
mkdir -p /var/log/${PROJECT}
mkdir -p /var/log/${PROJECT}/nginx
chmod -R 777 /var/log/${PROJECT}/gunicorn

# create a virtual env to hold our project
su - wwwpub

mkvirtualenv ${PROJECT}

workon ${PROJECT}

## test django project creation ##
pip install django

django-admin.py startproject ${PROJECT} ${PATH}
cd /opt/www/${PROJECT}


# Django with Gunicorn 0.17.2
pip install gunicorn setproctitle

#To use Gunicorn's built-in Django integration, first add "gunicorn" to INSTALLED_APPS. Then run python manage.py run_gunicorn.

