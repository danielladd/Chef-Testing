name "hub-qa1"
default_attributes(
  "graphite" => {
    "host" => "stats02.nexus.commercehub.com",
    "port" => "8125"
  },
  "chub-batchagent" => {
    "debugString" = "-Xdebug -Xrunjdwp:transport=dt_socket,address=9081,server=y,suspend=n",
    "database" => {
      "log" =>{
        "server" = "",
        "name" = "",
        "user" = "",
        "pass" = "",
      }
    }
  }
)
