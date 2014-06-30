name "albers"
description "A windows machine running Albers (base role)"
default_attributes(
  "java" => {
    "windows" => {
      "url" => "http://artifactory01.nexus.commercehub.com/artifactory/java-distributions/jdk/7u51-b13/jdk-7u51-windows-x64.exe",
      "home" => 'C:\Program Files\Java\jdk1.7.0_51'
    }
  },
  "chub_log" => {
    "logfiles" => {
      "albers" => {
        "path" => 'c:\Albers\logs\albers.log',
        "type" => "albers"
      },
    "logfiles" => {
      "wrapper" => {
        "path" => 'c:\Albers\logs\wrapper.log',
        "type" => "wrapper"
      }
    },
    "types" => {
      "albers" => {
        "name" => "albers",
        "body" => "  multiline {\n          pattern => \"(^.+Exception: .+)|(^\\s+at .+)|(^\\s+... \d+ more)|(^\\s*Caused by:.+)\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIME:time} %{LOGLEVEL:loglevel} (%{JAVACLASS:classname}:%{INT:linenumber}) %{GREEDYDATA:albersmessage}" ]\n  }\n"
      },
      "wrapper" => {
        "name" => "albers",
        "body" => "  multiline {\n          pattern => \"[^|]* |(^.+Exception: .+)|(^\\s+at .+)|(^\\s+... \d+ more)|(^\\s*Caused by:.+)\"\n          what => \"previous\"\n        }\n  grok {\n    match => [ \"message\", \"%{TIME:time} | %{GREEDYDATA:albersmessage}\" ]\n  }\n"
      },
    }
  }
)
