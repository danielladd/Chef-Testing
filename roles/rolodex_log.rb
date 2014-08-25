name "rolodex_log"
description "role for rolodex_log (logstash)"
default_attributes(
	"chub_log" => {
		"types" => {
			"rolodex" => {
				"name" => "rolodex",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"message\", \"%{LOGLEVEL:loglevel}\\s*\\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\\] (?<classname>%{JAVACLASS}|[^\\s]+): %{GREEDYDATA:message}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY-MM-dd HH:mm:ss,SSS\" ]\n    locale => \"en\"\n}"
			},
			"rolodex_requests" => {
				"name" => "rolodex_requests",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"message\", \"%{IPORHOST:clientip} (?:%{USER:ident}|-) (?:%{USER:ident}|-) \\[%{HTTPDATE:timestamp}\\] \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} (?:%{NUMBER}|-) (?:%{NUMBER}|-) (?:%{NUMBER:bytes}|-)\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    locale => \"en\"\n}"
			},
			"rolodex_syslog" => {
				"name" => "rolodex_syslog",
				"body" => "grok {\n	match => [ \"message\", \"%{SYSLOGLINE}\" ]\n}"
			}
		}
	}
)
