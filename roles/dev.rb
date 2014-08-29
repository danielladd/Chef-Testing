name "dev"
description "Role for defining attributes for the dev environment"
default_attributes(
	"chub_log" => {
		"endpoint" => "lsdev.nexus.commercehub.com"
	}
)
