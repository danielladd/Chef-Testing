name "landingstrip_dev"
description "A linux machine running landingstrip (in development)"
run_list "recipe[base]", "recipe[chub_mc_app]", "recipe[chub_mc_logs]"
default_attributes "chub_mc_app" => {
	"port" => "9100",
	"app_name" => "landingstrip",
	"jar_file_url" => "file://bamboom1/drive_d$/bambooM1/xml-data/build-dir/MC-LAN-BS/app/landingstrip/landingstrip.jar"
},
"chub_mc_logs" => {
	"mc_resource" => "landingstrip",
	"log_server" => "lsdev01.nexus.commercehub.com"
}