name "netsuitews_dev"
description "A linux machine running netsuite webservice(in development)"
run_list "recipe[base]", "recipe[chub_mc_webservices]"
default_attributes "chub_mc_app" => {
	"port" => "9400",
	"app_name" => "catalog",
	"jar_file_url" => "http://bamboom1:8085/browse/MC-CNM/latest/artifact/shared/Catalog/catalog.jar?os_username=mess&os_password=messuser"
}
