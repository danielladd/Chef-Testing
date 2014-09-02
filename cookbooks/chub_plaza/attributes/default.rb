default[:chub_plaza][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/plaza/%5BRELEASE%5D/plaza-%5BRELEASE%5D.jar"
default[:chub_plaza][:java_heap_size] = "512M"
default[:chub_plaza][:hazelcast][:group] = "#{node.chef_environment}-plaza"
default[:chub_plaza][:greenmail][:disabled] = true
default[:chub_plaza][:mail][:disabled] = false
