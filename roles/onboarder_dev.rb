name "onboarder_dev"
description "A linux machine running onboarder (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9300",
	"app_name" => "onboarder",
	"jar_file_url" => "http://bamboom1:8085/browse/MC-ONB/latestSuccessful/artifact/shared/Onboarder-App-Jar/onboarder.jar?os_username=mess&os_password=messuser"
},
"chub_mc_logs" => {
	"mc_resource" => "onboarder",
	"log_server" => "lsdev01.nexus.commercehub.com"
}
