cd /tmp/

wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y remi-release-6.rpm

yum install -y --enablerepo=remi php php-fpm

