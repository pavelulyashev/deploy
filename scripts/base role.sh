yum update -y
yum install -y mc wget which screen subversion bzr git hg
cd /tmp

################# htop 1.0.2 - (C) 2004-2011 Hisham Muhammad  #################
yum install -y http://pkgs.repoforge.org/htop/htop-1.0.2-1.el6.rf.x86_64.rpm
###############################################################################

#################            Adding Thumbtack repo            #################
yum install -y http://repo.dev.thumbtack.net/centos/thumbtack-release-0.1.1-1.noarch.rpm
yum install -y runit
###############################################################################

######### Extra Packages for Enterprise Linux repository configuration #########
yum install -y http://fedora-mirror01.rbc.ru/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Disable EPEL by default
sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo
###############################################################################

#################            Firewall configuration           #################
# Add this to /etc/sysconfig/iptables
sed -i '10a-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT' /etc/sysconfig/iptables
service iptables restart
###############################################################################