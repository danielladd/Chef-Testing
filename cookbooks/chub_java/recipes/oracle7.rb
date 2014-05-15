node.default[:java][:jdk_version] = '7'

case node['platform_family']
when "windows"
  node.default[:java][:install_flavor] = 'windows'
  node.default[:java][:java_home] = 'c:\Program Files\Java'
  node.default[:java][:windows][:url] = 'http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/7u51-b13/jdk-7u51-windows-x64.exe'
  node.default[:java][:windows][:checksum] = 'd1367410be659f1b47e554e7bd011ea0'
  node.default[:java][:windows][:package_name] = "Java(TM) SE Development Kit 7 (64-bit)"
else
  node.default[:java][:install_flavor] = 'oracle'
end

include_recipe 'java::default'
