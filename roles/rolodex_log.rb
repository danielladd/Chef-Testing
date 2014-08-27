name "rolodex_log"
description "role for rolodex_log (logstash)"
default_attributes(
	"chub_log" => {
		"types" => {
			"rolodex" => {
				"name" => "rolodex",
				"body" => "multiline {\n	pattern => \"^%{LOGLEVEL:loglevel}\\s\"\n	what => \"previous\"\n	negate => true\n}\ngrok {\n	match => [ \"message\", \"(?m)%{LOGLEVEL:loglevel}\\s*\\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\\] (?<classname>%{JAVACLASS}|[^\\s]+): %{GREEDYDATA:content}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY-MM-dd HH:mm:ss,SSS\" ]\n    target => [\"@timestamp\"]\n}"
			},
			"rolodex_requests" => {
				"name" => "rolodex_requests",
				"body" => "grok {\n	match => [ \"message\", \"%{IPORHOST:clientip} (?:%{USER:ident}|-) (?:%{USER:ident}|-) \\[%{HTTPDATE:logdate}\\] \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} (?:%{NUMBER}|-) (?:%{NUMBER}|-) (?:%{NUMBER:bytes}|-)\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    target => [\"@timestamp\"]\n}"
			},
			"rolodex_syslog" => {
				"name" => "rolodex_syslog",
				"body" => "grok {\n	match => [ \"message\", \"%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:program}(?:\\[%{POSINT:pid}\\])?: %{GREEDYDATA:content}\" ]\n}\nsyslog_pri { }\ndate {\n	match => [ \"syslog_timestamp\", \"MMM  d HH:mm:ss\", \"MMM dd HH:mm:ss\" ]\n	timezone => \"America/New_York\"\n}"
			}
		}
	}
)