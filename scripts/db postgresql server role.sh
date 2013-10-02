# check http://yum.postgresql.org/repopackages.php

cd /tmp
wget http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

yum install -y pgdg-centos93-9.3-1.noarch.rpm
yum install -y postgresql93-server


chkconfig postgresql-9.3 on
service postgresql-9.3 initdb
service postgresql-9.3 start


#su postgres -c psql
# Давайте изменим пароль пользователя postgresql - postgres:
#ALTER USER postgres WITH PASSWORD 'pswd1234';
# Для выхода из SQL консоли необходимо ввести:
#\q

# Теперь пользователь в БД имеет наш пароль, но нужно еще изменить пароль в ОС (выполняем от суперпользователя):
#passwd -d postgres
#su postgres -c passwd

# Установка админского пакета pgsql
yum install -y postgresql93-contrib

#su postgres -c psql
#CREATE EXTENSION adminpack

yum install -y --enablerepo=epel --nogpgcheck phpPgAdmin

#CREATE USER traveler WITH PASSWORD 'traveler' CREATEDB;;

#http://hutpu4.net/linux-open-source/postgresql-phppgadmin-for-debian-ubuntu.html