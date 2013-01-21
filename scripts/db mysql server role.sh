yum install -y mysql-server mysql

chkconfig mysqld on
service mysqld start
/usr/bin/mysqladmin -u root password 'pswd1234'

yum install -y --enablerepo=epel --nogpgcheck phpmyadmin