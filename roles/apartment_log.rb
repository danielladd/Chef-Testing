name "apartment_log"
description "role for apartment_log (logstash)"
default_attributes(
	"chub_log" => {
		"types" => {
			"apartment" => {
				"name" => "apartment",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"%{LOGLEVEL:loglevel}\\s*\\[(?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME})\\] %{JAVACLASS}: %{GREEDYDATA:message}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY-MM-dd HH:mm:ss\" ]\n    locale => \"en\"\n}"
			},
			"apartment_wrapper" => {
				"name" => "apartment_wrapper",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"((?<loglevel>%{LOGLEVEL}|STATUS)) (\\s*\\|\\s*) (?<logwriter>[a-zA-Z0-9\\s]*) (\\s*\\|\\s*) (?<logdate>%{YEAR}[/-]%{MONTHNUM}[/-]%{MONTHDAY} %{TIME}) (\\s*\\|\\s*) %{GREEDYDATA:message}\" ]\n}\ndate {\n	match => [ \"logdate\", \"YYYY/MM/dd HH:mm:ss\" ]\n    locale => \"en\"\n}"
			},
			"apartment_requests" => {
				"name" => "apartment_requests",
				"body" => "multiline {\n	pattern => \"^[^|]* | \\s\"\n	what => \"previous\"\n}\ngrok {\n	match => [ \"raw_log\", \"%{IPORHOST:clientip} (?:%{USER:ident}|-)  (?:%{USER:ident}|-)  \\[%{HTTPDATE:timestamp}\\] \\\"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\\\" %{NUMBER:response} - %{QS:referrer} %{QS:agent}  (?:%{NUMBER:bytes}|-)\" ]\n}\ndate {\n	match => [ \"logdate\", \"dd/MMM/YYYY:HH:mm:ss Z\"]\n    locale => \"en\"\n}"
			}
		}
	}
)
