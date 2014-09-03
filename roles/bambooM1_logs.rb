name "bambooM1_logs"
description "role for the logstash server defining the bamboo01 logs and parsing rules"
default_attributes(
  "chub_log" => {
    "types" => {
      "bamboo_log" => {
        "name" => "bamboo_log",
        "body" => "  multiline {\n          pattern => \"^\\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIMESTAMP_ISO8601:timestamp},\\d+ %{LOGLEVEL:level} \\[(?<name>[^\\]]+)\] \\[(?<class>[^\\]]+)\\] (?<payload>(.|\\s)+)\" ]\n  }\n"
      }
    }
  }
)
