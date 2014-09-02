#default[:chub_census][:app_url] = "file:///vagrant/census-shadow.jar"
default[:chub_census][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/census-server/%5BRELEASE%5D/census-server-%5BRELEASE%5D-shadow.jar"

default[:chub_census][:java_heap_size] = "512M"
default[:chub_census][:profileUpdateNotificationUrls] = []

default[:chub_census][:authentication][:activedirectory][:domain] = "nexus.commercehub.com"
default[:chub_census][:authentication][:activedirectory][:domain_controller] = "ldap.nexus.commercehub.com"
default[:chub_census][:authentication][:activedirectory][:required_groups] = []
default[:chub_census][:authentication][:cache_policy] = "maximumSize=10000,expireAfterWrite=15m"

