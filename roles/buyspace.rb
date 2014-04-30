name "buyspace"
description "Standard settings common to Buyspace"
default_attributes "chub-buyspace" => {
	"java" => {
		'jdk_version' => 7,
		'install_flavor' => 'oracle'
	},
    "tomcat" => {
      "base_version" => 7,
      "loglevel" => 'WARN'
    }
}
