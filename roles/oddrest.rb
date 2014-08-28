name "oddrest"
description "role for oddrest machines"
run_list *%w[
	recipe[chub_oddrest::default]
    recipe[chub_oddrest::sensu_client]
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
			"oddrest" => {
				"path" => "/var/log/oddrest/oddrest.log",
				"type" => "oddrest"
			},
			"oddrest_requests" => {
				"path" => "/var/log/oddrest/requests.log",
				"type" => "oddrest_requests"
			},
			"oddrest_syslog" => {
				"path" => "/var/log/syslog",
				"type" => "oddrest_syslog"
			}
		}
	}
)
