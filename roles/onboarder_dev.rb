name "onboarder_dev"
description "A linux machine running onboarder (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]",
default_attributes "chub_mc_app" => {
	"port" => "9300",
	"app_name" => "onboarder",
	"jar_file_url" => "http://bamboom1:8085/browse/MC-ONB/latest/artifact/shared/Onboarder-App-Jar/onboarder.jar?os_username=mess&os_password=messuser"
},
"ulimit" => {
  "users" => {
	"mongodb" => {
	  "filehandle_limit" => 64000,
	  "process_limit" => 32000,
	  "memory_limit" => "unlimited"
	},
	"root" => {
	  "filehandle_limit" => 64000,
	  "process_limit" => 32000,
	  "memory_limit" => "unlimited"
	}
  }
},
"mongodb" => {
  "enable_rest" => true,
  "dbpath" => "/data/db"
}
