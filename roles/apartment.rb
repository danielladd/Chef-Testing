name "apartment"
description "role for apartment machines"
run_list *%w[
	recipe[chub_apartment::default]
    recipe[chub_apartment::sensu_client]
	recipe[chub_log::client]
]
default_attributes(
	"sensu" => {
		"rabbitmq" => {
			"host" => "monmq01.nexus.commercehub.com"
		}
	},
	"chub_log" => {
		"logfiles" => {
			"apartment" => {
				"path" => "/opt/apartment/bin/logs/apartment.log",
				"type" => "apartment"
			},
			"apartment_wrapper" => {
				"path" => "/opt/apartment/logs/wrapper.log",
				"type" => "apartment_wrapper"
			}
		},
		"types" => {
			"apartment" => {
				"name" => "apartment",
				"body" => "  multiline {\n          pattern => \"^\\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"raw_log\", \"%{TIMESTAMP_ISO8601:time} %{LOGLEVEL:loglevel} \\(%{JAVACLASS:classname}:%{INT:linenumber}\\) %{GREEDYDATA:apartmentmessage}\" ]\n  }\n"
			},
			"apartment_wrapper" => {
				"name" => "apartment_wrapper",
				"body" => "  multiline {\n          pattern => \"^[^|]* | \\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"raw_log\", \"%{TIMESTAMP_ISO8601:time} | %{GREEDYDATA:apartmentmessage}\" ]\n  }\n"      
			}
		}
	}
)
