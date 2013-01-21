# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/opt/www
export VIRTUALENVWRAPPER_PYTHON=/opt/python2.7/bin/python
export VIRTUALENVWRAPPER_SCRIPT=/opt/python2.7/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV=/opt/python2.7/bin/virtualenv
source /opt/python2.7/bin/virtualenvwrapper_lazy.sh
