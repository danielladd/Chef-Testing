name "rolodex"
description "role for rolodex machines"
run_list *%w[
	recipe[chub_rolodex::default]
    recipe[chub_rolodex::sensu_client]
	recipe[chub_log::client]
]
default_attributes(
	"sensu" => {
		"rabbitmq" => {
			"host" => "monmq.nexus.commercehub.com"
		}
	},
	"chub_log" => {
		"endpoint" => "10.10.80.111",
		"logfiles" => {
			"rolodex" => {
				"path" => "/var/log/rolodex/rolodex.log",
				"type" => "rolodex"
			},
			"rolodex_requests" => {
				"path" => "/var/log/rolodex/requests.log",
				"type" => "rolodex_requests"
			},
			"rolodex_syslog" => {
				"path" => "/var/log/syslog",
				"type" => "rolodex_syslog"
			}
		}
	}
)
