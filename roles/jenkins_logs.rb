name "jenkins_logs"
description "role for the logstash server defining the jenkins logs and parsing rules"
default_attributes(
  "chub_log" => {
    "endpoint" => "PC-DEV-BC.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "jenkins_log" => {
        "path" => 'D:/ci/jenkins.err.log',
        "type" => "jenkins_err_log"
      }
    },
    "types" => {
      "jenkins_err_log" => {
        "name" => "jenkins_err_log",
        "body" => "  multiline {\n          pattern => \"^\\s\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIMESTAMP_ISO8601:time} %{LOGLEVEL:loglevel} \\(%{JAVACLASS:classname}:%{INT:linenumber}\\) %{GREEDYDATA:albersmessage}\" ]\n  }\n"
      }
    }
  }
)
