name "rundeck_logs"
description "role for the logstash server defining the rundeck logs and parsing rules"
default_attributes(
  "chub_log" => {
    "endpoint" => "lsdev.nexus.commercehub.com",
    "endpoint_port" => "2352",
    "logfiles" => {
      "rundeck_log" => {
        "path" => '/var/log/rundeck/rundeck.log',
        "type" => "rundeck_log"
      },
      "rundeck_service_log" => {
        "path" => '/var/log/rundeck/service.log',
        "type" => "rundeck_service_log"
      },
      "rundeck_audit_log" => {
        "path" => '/var/log/rundeck/rundeck.audit.log',
        "type" => "rundeck_audit_log"
      },
      "rundeck_jobs_log" => {
        "path" => '/var/log/rundeck/rundeck.jobs.log',
        "type" => "rundeck_jobs_log"
      },
    },
    "types" => {
      "rundeck_log" => {
        "name" => "rundeck_log",
        "body" => " multiline {\n          pattern => \"(^.+Exception: .+)|(^\\s)|(^.+Stacktrace follows.+)\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"raw_log\", \"(?m)%{DATE:date} %{TIME:time} %{GREEDYDATA:thread} %{LOGLEVEL:level}  %{JAVACLASS:class} - %{GREEDYDATA:content}\" ]\n  }\n"
      },
      "rundeck_service_log" => {
        "name" => "rundeck_service_log",
        "body" => "" 
      },
      "rundeck_audit_log" => {
        "name" => "rundeck_audit_log",
        "body" => "  grok {\n    match => [ \"raw_log\", \"%{DATE:date} %{TIME:time} - Evaluating Decision for: res<%{GREEDYDATA:evaluate}> subject<Username:%{USER:username} Group:%{GREEDYDATA:group}> action<%{WORD:action}> env<%{URI:env}>: authorized: %{WORD:authorized}: %{WORD}, reason: %{WORD:reason}, evaluations: %{GREEDYDATA:evaluation}\" ]\n  }\n"
      },
      "rundeck_jobs_log" => {
        "name" => "rundeck_jobs_log",
        "body" => "  grok {\n    match => [ \"raw_log\", \"%{DATE:date} %{TIME:time}\\] %{USER:user} %{WORD:action} \\[%{UUID:uuid}\\] %{WORD:project} %{QS:job} %{GREEDYDATA:status}\" ]\n  }\n"
      },
    }
  },
)