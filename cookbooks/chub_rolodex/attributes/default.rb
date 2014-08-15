default[:chub_rolodex][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/rolodex/%5BRELEASE%5D/rolodex-%5BRELEASE%5D.jar"
default[:chub_rolodex][:java_heap_size] = "512M"

default[:slm][:odd_service][:baseUrl] = "http://odddev1-rest.nexus.commercehub.com"
default[:slm][:apartment][:baseUrl] = "http://odddev1-apartment.nexus.commercehub.com"
default[:slm][:rolodex][:baseUrl] = "http://odddev1-rolodex.nexus.commercehub.com"
default[:slm][:sso][:vault] = "https://ssoint1-vault.nexus.commercehub.com:8080"
default[:slm][:sso][:census] = "https://ssoint1-census.nexus.commercehub.com:8080"
default[:slm][:sso][:castle] = "https://ssoint1-apps.nexus.commercehub.com/account"
default[:slm][:sso][:plaza] = "https://ssoint1-apps.nexus.commercehub.com/user"
default[:slm][:ordersteam][:app][:id] = "DSM"
default[:slm][:ordersteam][:app][:name] = "odddev1_orderstream"

default[:chub_rolodex][:yui][:filter] = "min"
default[:chub_rolodex][:yui][:combine] = true
default[:chub_rolodex][:yui][:url] = "http://yuicombo1.nexus.commercehub.com:3000"

default[:slm][:graphite][:host] = "stats02.nexus.commercehub.com"
default[:slm][:graphite][:port] = "2003"