cd /tmp

#################              Adding Puppet repo             #################
wget http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-6.noarch.rpm
yum install -y puppetlabs-release-6-6.noarch.rpm
###############################################################################

yum install -y --enablerepo=epel puppet-server 
yum install -y --enablerepo=epel puppet

sed -i 's/\[main\]/\[main\]\n    server = puppeteer.thumbtack.lo\n/' /etc/puppet/puppet.conf

puppet agent -t