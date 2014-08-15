#! /bin/bash
file='chef_11.10.4-1.ubuntu.12.04_amd64.deb'
if [ ! -f /vagrant/$file ]; then
	apt-get install -y curl libcurl3 && curl -L https://www.opscode.com/chef/install.sh | sudo bash
else
	dpkg -i /vagrant/$file
fi
