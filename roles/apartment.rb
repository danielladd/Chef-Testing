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
				"path" => "/opt/apartment/logs/apartment.log",
				"type" => "apartment"
			},
			"wrapper" => {
				"path" => "/opt/apartment/logs/wrapper.log",
				"type" => "wrapper"
			},
			"requests" => {
				"path" => "/opt/apartment/logs/requests.log",
				"type" => "requests"
			}
		},
		"types" => {
			"apartment" => {
				"name" => "apartment",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"%{LOGLEVEL:loglevel}\s*\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\] %{JAVACLASS}: %{GREEDYDATA:message}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY/MM/dd HH:mm:ss\" ]\n}"
			},
			"wrapper" => {
				"name" => "apartment wrapper",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"((?<loglevel>%{LOGLEVEL}|STATUS)) (\s*\|\s*) (?<logwriter>[a-zA-Z0-9\s]*) (\s*\|\s*) (?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME}) (\s*\|\s*) %{GREEDYDATA:message}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY/MM/dd HH:mm:ss\" ]\n}"
			},
			"requests" => {
				"name" => "apartment requests",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"(%{IPORHOST:clientip} (?:%{USER:ident}|-)  (?:%{USER:ident}|-)  \[%{HTTPDATE:logdate}\] \"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\" %{NUMBER:response} - %{QS:referrer} %{QS:agent} (?:%{NUMBER:bytes}|-))\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    locale => \"en\"\n}"
			}
		}
	}
)
