name "hub-qa1"
default_attributes(
  "graphite" => {
    "host" => "stats02.nexus.commercehub.com",
    "port" => "8125"
  },
  "chub-batchagent" => {
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
