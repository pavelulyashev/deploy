cd /tmp

yum install -y gcc make
yum install -y freetype freetype-devel libjpeg libjpeg-devel libpng libpng-devel zlib zlib-devel libtiff libtiff-devel tk tk-devel tcl tcl-devel
yum install -y gdbm-devel readline-devel ncurses-devel bzip2-devel sqlite-devel db4-devel openssl-devel bluez-libs-devel python-devel libevent-devel 

wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
tar -zxf Python-2.7.3.tgz
cd /tmp/Python-2.7.3
./configure --prefix=/opt/python2.7 --enable-shared --with-threads
make
make install

echo /opt/python2.7/lib > /etc/ld.so.conf.d/python2.7.conf
ldconfig -v
yum uninstall -y gcc make

cd /tmp

wget http://peak.telecommunity.com/dist/ez_setup.py
/opt/python2.7/bin/python ez_setup.py

wget http://python-distribute.org/distribute_setup.py
/opt/python2.7/bin/python distribute_setup.py

wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
/opt/python2.7/bin/python get-pip.py

/opt/python2.7/bin/pip install virtualenv virtualenvwrapper