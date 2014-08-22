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
		"endpoint" => "10.10.80.111",
		"logfiles" => {
			"apartment" => {
				"path" => "/opt/apartment/logs/apartment.log",
				"type" => "apartment"
			},
			"apartment_wrapper" => {
				"path" => "/opt/apartment/logs/wrapper.log",
				"type" => "apartment_wrapper"
			},
			"apartment_requests" => {
				"path" => "/opt/apartment/logs/requests.log",
				"type" => "apartment_requests"
			}
		}
	}
)
