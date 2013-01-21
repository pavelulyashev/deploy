# add a user to own our web content
adduser wwwpub -c 'WWW Content Publisher'
mkdir -p /opt/www
chown -R wwwpub:wwwpub /opt/www

echo 'export WORKON_HOME=$HOME/.virtualenvs' >> /home/wwwpub/.bashrc
echo 'export PROJECT_HOME=/opt/www' >> /home/wwwpub/.bashrc
echo 'export VIRTUALENVWRAPPER_PYTHON=/opt/python2.7/bin/python' >> /home/wwwpub/.bashrc
echo 'export VIRTUALENVWRAPPER_SCRIPT=/opt/python2.7/bin/virtualenvwrapper.sh' >> /home/wwwpub/.bashrc
echo 'export VIRTUALENVWRAPPER_VIRTUALENV=/opt/python2.7/bin/virtualenv' >> /home/wwwpub/.bashrc
echo 'source /opt/python2.7/bin/virtualenvwrapper_lazy.sh' >> /home/wwwpub/.bashrc

chown -R wwwpub:wwwpub /home/wwwpub/