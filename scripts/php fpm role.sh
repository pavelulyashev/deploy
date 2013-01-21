cd /tmp/

wget http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-10.ius.el6.noarch.rpm
yum install -y ius-release-1.0-10.ius.el6.noarch.rpm

# PHP 5.4.10 anf PHP FPM
yum install -y php54 php54-fpm

