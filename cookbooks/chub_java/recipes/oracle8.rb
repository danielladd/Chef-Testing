node.default[:java][:jdk_version] = '8'

case node['platform_family']
when "windows"
  node.default[:java][:install_flavor] = 'windows'
  node.default[:java][:java_home] = 'c:\Program Files\Java'
  node.default[:java][:windows][:url] = 'http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/8-b132/jdk-8-windows-x64.exe'
  node.default[:java][:windows][:checksum] = '0a577a15cbd9ec7af37ee288e324965e'
  node.default[:java][:windows][:package_name] = "Java(TM) SE Development Kit 8 (64-bit)"
else
  node.default[:java][:install_flavor] = 'oracle'
end

include_recipe 'java::default'
