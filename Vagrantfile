# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "D:\\opscode_ubuntu-12.04_chef-provisionerless.box"


  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     #vb.customize ["modifyvm", :id, "--memory", "1024"]
   end
 
  config.omnibus.chef_version = :latest
 
   config.vm.provision "chef_client" do |chef|
     chef.chef_server_url = "https://api.opscode.com/organizations/dladd"
	 chef.validation_key_path = "./.chef/dladd-validator.pem"
     chef.validation_client_name = "dladd-validator"
     chef.node_name = "chef_node1"
   end
   
   
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
