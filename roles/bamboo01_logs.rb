name "bamboo01_logs"
description "role for the logstash server defining the bamboo01 logs and parsing rules"
default_attributes(
  "chub_log" => {
    "endpoint" => "pc-dev-bc.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "*.log" => {
        "path" => 'C:\\Program Files\\Bamboo\\logs\\*.log',
        "type" => "bamboo_log"
      }
    },
    "types" => {
      "bamboo_log" => {
        "name" => "bamboo_log",
        "body" => "  multiline {\n          pattern => \"^\\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIMESTAMP_ISO8601:time} %{LOGLEVEL:loglevel} \\(%{JAVACLASS:classname}:%{INT:linenumber}\\) %{GREEDYDATA:albersmessage}\" ]\n  }\n"
      }
    }
  }
)
