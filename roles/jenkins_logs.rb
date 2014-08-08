name "jenkins_logs"
description "role for the logstash server defining the jenkins logs and parsing rules"
default_attributes(
  "chub_log" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "jenkins_log" => {
        "path" => 'D:\\ci01\\jenkins.err.log',
        "type" => "jenkins.err.log"
      }
    },
  },
)
