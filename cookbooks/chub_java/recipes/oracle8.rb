node.default[:java][:install_flavor] = 'oracle'
node.default[:java][:jdk_version] = '8'

include_recipe 'java::oracle'
