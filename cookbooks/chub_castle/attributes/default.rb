default[:chub_castle][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/castle/%5BRELEASE%5D/castle-%5BRELEASE%5D.war"
default[:chub_castle][:java_heap_size] = "512M"
default[:chub_castle][:keystore_file] = "keystore.jks"
default[:chub_castle][:truststore_file] = "truststore.jks"
default[:chub_castle][:keystore_password] = "changeit"
default[:chub_castle][:truststore_password] = "changeit"
default[:chub_castle][:hazelcast][:group] = "#{node.chef_environment}-castle"
default[:chub_castle][:hazelcast][:service_ticket_timeout] = 300
default[:chub_castle][:hazelcast][:ticket_granting_ticket_timeout] = 7200
