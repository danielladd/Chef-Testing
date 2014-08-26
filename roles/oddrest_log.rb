name "oddrest_log"
description "role for oddrest_log (logstash)"
default_attributes(
	"chub_log" => {
		"types" => {
			"oddrest" => {
				"name" => "oddrest",
				"body" => "multiline {\n	pattern => \"^%{LOGLEVEL:loglevel}\\s\"\n	what => \"previous\"\n	negate => true\n}\ngrok {\n	match => [ \"message\", \"(?m)%{LOGLEVEL:loglevel}\\s*\\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\\] %{JAVACLASS:classname}: %{GREEDYDATA:content}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY-MM-dd HH:mm:ss,SSS\" ]\n    target => [\"@timestamp\"]\n}"
			},
			"oddrest_requests" => {
				"name" => "oddrest_requests",
				"body" => "grok {\n	match => [ \"message\", \"%{IPORHOST:clientip} (?:%{USER:ident}|-)  (?:%{USER:ident}|-)  \\[%{HTTPDATE:logdate}\\] \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} - %{QS:referrer} %{QS:agent}(\\s*)(?:%{NUMBER:bytes}|-)\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    target => [\"@timestamp\"]\n}"
			},
			"oddrest_syslog" => {
				"name" => "oddrest_syslog",
				"body" => "grok {\n	match => [ \"message\", \"%{SYSLOGLINE}\" ]\n}"
			}
		}
	}
)
