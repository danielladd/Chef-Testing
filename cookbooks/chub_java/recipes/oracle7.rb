node.default[:java][:install_flavor] = 'oracle'
node.default[:java][:jdk_version] = '7'

include_recipe 'java::oracle'
