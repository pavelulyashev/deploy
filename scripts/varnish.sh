# Adding varnish-cache.org repo
echo -e '[varnish-3.0]\nname=Varnish 3.0 - $basearch\nbaseurl=http://repo.varnish-cache.org/redhat/varnish-3.0/el6/$basearch\nenabled=1\ngpgcheck=0' >> /etc/yum.repos.d/varnish.repo
# varnish/3.0.3
yum install -y varnish
