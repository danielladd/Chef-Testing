name "landingstrip_dev"
description "A linux machine running landingstrip (in development)"
run_list "recipe[base]", "recipe[ulimit]", "recipe[mongodb::10gen_repo]", "recipe[mongodb]", "recipe[chub_mc_app]" 
default_attributes "chub_mc_app" => {
	"port" => "9100",
	"app_name" => "landingstrip",
	"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/landingstrip/0.1/landingstrip.jar"
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
