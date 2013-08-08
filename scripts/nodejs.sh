cd /tmp
wget http://nodejs.org/dist/v0.10.15/node-v0.10.15-linux-x64.tar.gz
tar -zxvf node-v0.10.15-linux-x64.tar.gz
mv node-v0.10.15-linux-x64 /opt/

cd /opt
ln -s node-v0.10.15-linux-x64 node
ln -s /opt/node/bin/node /usr/local/bin/node
ln -s /opt/node/bin/npm /usr/local/bin/npm