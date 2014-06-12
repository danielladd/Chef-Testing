name "catalog_test"
description "A linux machine running catalog of controls (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalog",
	"jar_file_url" => "http://artifactory01/artifactory/simple/inteng-snapshot/catalog/0.1/catalogtest.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "catalog",
	"log_server" => "lsdev.nexus.commercehub.com"
}

