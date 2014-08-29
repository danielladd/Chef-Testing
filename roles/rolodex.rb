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
		"endpoint" => "lsdev.nexus.commercehub.com",
		"logfiles" => {
			"rolodex" => {
				"path" => "/var/log/upstart/rolodex_file.log",
				"type" => "rolodex"
			},
			"rolodex_requests" => {
				"path" => "/var/log/upstart/rolodex_requests.log",
				"type" => "rolodex_requests"
			},
			"rolodex_syslog" => {
				"path" => "/var/log/syslog",
				"type" => "rolodex_syslog"
			}
		}
	}
)
