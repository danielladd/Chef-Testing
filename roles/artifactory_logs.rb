name "artifactory_logs"
description "role for the logstash server defining the artifactory logs and parsing rules"
default_attributes( 
  "chub_log" => {
    "types" => {
      "artifactory_log" => {
        "name" => "artifactory_log",
        "body" => "  multiline {\n          pattern => \"^\\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIMESTAMP_ISO8601:time} %{LOGLEVEL:loglevel} \\(%{JAVACLASS:classname}:%{INT:linenumber}\\) %{GREEDYDATA:albersmessage}\" ]\n  }\n"
      }
    }
  }
)
