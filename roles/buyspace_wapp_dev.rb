name "buyspace_wapp_dev"
description "role defining buyspace wapp in dev."
default_attributes "chub-buyspace" => {
    "mongo" => {
         "databaseName" => "marketplaceProd",
          "replicas" => ['mpqa2db1.nexus.commercehub.com', 'mpqa2db2.nexus.commercehub.com', 'mpqa2db3.nexus.commercehub.com']
    },
    "solr" => {
      "url" => "http://mpqa2db1/solr/"
    },
    "klerk" => {
      "url" => "http://mpqa2-klerk.commercehub.com:8090"
    },
    "hornetq" => {
      "host" => "mpqa2db2.nexus.commercehub.com",
      "port" => 5445
    },
    "taskScheduler" => {
      "enabled" => false
    },
    "grails" => {
      "serverURL" => "http://localhost:8080",
      "apiServerURL" => "http://localhost:8080"
    },
    "antivirus" => {
      "hosts" => "['10.10.40.80']",
      "enabled" => true,
      "port" => 1334
    }
}
