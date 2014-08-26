name "apartment_log"
description "role for apartment_log (logstash)"
default_attributes(
	"chub_log" => {
		"types" => {
			"apartment" => {
				"name" => "apartment",
				"body" => "multiline {\n	pattern => \"^%{LOGLEVEL:loglevel}\\s\"\n	what => \"previous\"\n	negate => true\n}\ngrok {\n	match => [ \"message\", \"(?m)%{LOGLEVEL:loglevel}\\s*\\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\\] %{JAVACLASS:classname}: %{GREEDYDATA:content}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY-MM-dd HH:mm:ss,SSS\" ]\n    target => [\"@timestamp\"]\n}"
			},
			"apartment_wrapper" => {
				"name" => "apartment_wrapper",
				"body" => "grok {\n	match => [ \"message\", \"((?<loglevel>%{LOGLEVEL}|STATUS)) (\\s*\\|\\s*) (?<logwriter>[a-zA-Z0-9\\s]*) (\\s*\\|\\s*) (?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME}) (\\s*\\|\\s*) %{GREEDYDATA:content}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY/MM/dd HH:mm:ss\" ]\n    target => [\"@timestamp\"]\n}"
			},
			"apartment_requests" => {
				"name" => "apartment_requests",
				"body" => "grok {\n	match => [ \"message\", \"%{IPORHOST:clientip} (?:%{USER:ident}|-)  (?:%{USER:ident}|-)  \\[%{HTTPDATE:logdate}\\] \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} - %{QS:referrer} %{QS:agent}(\\s*)(?:%{NUMBER:bytes}|-)\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    target => [\"@timestamp\"]\n}"
			},
			"apartment_syslog" => {
				"name" => "apartment_syslog",
				"body" => "grok {\n	match => [ \"message\", \"%{SYSLOGLINE}\" ]\n}"
			}
		}
	}
)
