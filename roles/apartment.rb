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
		"endpoint" => "10.10.99.16",
		"logfiles" => {
			"apartment" => {
				"path" => "/var/log/apartment/apartment.log",
				"type" => "apartment"
			},
			"apartment_wrapper" => {
				"path" => "/var/log/apartment/wrapper.log",
				"type" => "apartment_wrapper"
			},
			"apartment_requests" => {
				"path" => "/var/log/apartment/requests.log",
				"type" => "apartment_requests"
			},
			"apartment_syslog" => {
				"path" => "/var/log/syslog",
				"type" => "apartment_syslog"
			}
		}
	}
)