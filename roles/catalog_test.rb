name "catalog_test"
description "A linux machine running catalog of controls (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalog",
	"jar_file_url" => "http://artifactory01/artifactory/simple/inteng-snapshot/catalog/0.1/catalogtest.jar"
}
