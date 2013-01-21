# Adding nginx.org repo
yum install -y http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

# nginx/1.2.6
yum install -y nginx
chkconfig nginx on
service nginx start
