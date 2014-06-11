name "catalog_dev"
description "A linux machine running catalog of controls (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalog",
	"jar_file_url" => "file://bamboom1/drive_d$/bambooM1/xml-data/build-dir/MC-CNM-JOB1/app/connectionmanager/catalog.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "catalog",
	"log_server" => "lsdev01.nexus.commercehub.com"
}

