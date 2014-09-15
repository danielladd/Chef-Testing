# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  
  # config.vm.define "chef_node1" do |chef_node1|
     # chef_node1.vm.box = "D:\\opscode_ubuntu-12.04_chef-provisionerless.box"


      # chef_node1.vm.network "forwarded_port", guest: 80, host: 8080

      # chef_node1.vm.provider "virtualbox" do |vb|
         # # Don't boot with headless mode
         # vb.gui = true
      
         # # Use VBoxManage to customize the VM. For example to change memory:
         # #vb.customize ["modifyvm", :id, "--memory", "1024"]
       # end
     
      # chef_node1.omnibus.chef_version = :latest
       # chef_node1.vm.provision "chef_client" do |chef|
         # chef.chef_server_url = "https://api.opscode.com/organizations/dladd"
         # chef.validation_key_path = "./.chef/dladd-validator.pem"
         # chef.validation_client_name = "dladd-validator"
         # chef.node_name = "chef_node1"
       # end
  # end
  
  
    config.vm.define "chef_node2" do |chef_node2|
      chef_node2.vm.box = "D:\\opscode_ubuntu-12.04_chef-provisionerless.box"


     chef_node2.vm.network "forwarded_port", guest: 80, host: 8081

      chef_node2.vm.provider "virtualbox" do |vb|
         # Don't boot with headless mode
         vb.gui = true
      
         # Use VBoxManage to customize the VM. For example to change memory:
         #vb.customize ["modifyvm", :id, "--memory", "1024"]
       end
     
      chef_node2.omnibus.chef_version = :latest
       chef_node2.vm.provision "chef_client" do |chef2|
         chef2.chef_server_url = "https://api.opscode.com/organizations/dladd"
         chef2.validation_key_path = "./.chef/dladd-validator.pem"
         chef2.validation_client_name = "dladd-validator"
         chef2.node_name = "chef_node2"
       end
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
