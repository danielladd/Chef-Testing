name "buyspace_web_qa1"
description "role defining buyspace web app in qa1"
default_attributes "chub-buyspace" => {
    "mongo" => {
         "databaseName" => "marketplaceProd_91212bak",
          "replicas" => ['mpqa05.nexus.commercehub.com:27777', 'mpqa03.nexus.commercehub.com:27777'],
          "blobstoreDatabaseName" => "marketplaceProd_91212bak_blobStore",
          "blobstoreReplicas" => ['mpqa05.nexus.commercehub.com:27777', 'mpqa03.nexus.commercehub.com:27777']
    },
    "solr" => {
      "url" => "http://mpqa03:7070/solr/"
    },
    "klerk" => {
      "url" => "http://mpqa1-klerk.commercehub.com:8090"
    },
    "hornetq" => {
      "host" => "mpqa2db2.nexus.commercehub.com",
      "port" => 5445
    },
    "taskScheduler" => {
      "enabled" => false
    },
    "grails" => {
      "serverURL" => "https://mpqa1-buyspace.commercehub.com",
      "apiServerURL" => "https://mpqa1-buyspace.commercehub.com"
     # "serverURL" => "http://qa-vip7.buyspace.com",
     #"apiServerURL" => "http://qa-vip7.buyspace.com"
      #"serverURL" => "http://localhost:8080",
      #"apiServerURL" => "http://localhost:8080"
    },
    "antivirus" => {
      "hosts" => "['10.10.40.80']",
      "enabled" => true,
      "port" => 1344
    },
    "sprite" => {
        "conductorApiUrl" => "http://mpqa05.nexus.commercehub.com:8080/sprite-conductor",
        "outputContainerPrefix" => "mpqa1-",
        "imageUrlTemplate" => "https://d172c2gjqice63.cloudfront.net/mpqa1-watermarked/${resourceId}-watermark-${size}-${size}.jpg"
    },
    "imageUploading" => {
      "amazon" => {
        "accessKey" => "AKIAIR3QJXR63XPHWPRA",
        "secretKey" => "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",
        "bucket" => "commercehub-sprite-mpqa1-uploaded",
        "duration" => "1.days"
      } 
    },
    "salesforce" => {
      "url" => "https://cs1.salesforce.com",
      "apiUrl" => "${salesforce.url}/services/data/v24.0",
      "clientId" => "3MVG99OxTyEMCQ3jLWU2aXrHra9IH.vcatnvgH6L4x4kiIDyvjLQuuBfIZVKPLPRA_qFWCRNaLkBB32KOnLzT",
      "clientSecret" => "3939258714251867600",
      "httpClient" => {
        "connectionsPerRoute" => 10,
        "totalConnections" => 100
      },
      "password" => "hAhE4awR",
      "tokenUrl" => "https://test.salesforce.com/services/oauth2/token",
      "username" => "buyspace@buyspace.com.staging"
    },
    "vertex" => {
      "enabled" => false,
      "hazelcastConfigFile" => "/marketplace/hazelcast/cluster.xml",
      "hostname" => "mpqa01",
      "port" => 25500
    },
    "msExchangeApi" => {
      "url" => "https://mymail.commercehub.com/ews/exchange.asmx",
      "credentials" => {
        "username" => "mpdev",
        "password" => "MarketPlaceDev1"
      }
    },
    "channelProductExporter" => {
      "imageUrlStrategy" => {
        "accessKey" => "AKIAIJPXRBZOL4RUMINA",
        "secretKey" => "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",
        "bucketName" => "commercehub-sprite-mpqa1-master",
        "keyTemplate" => "mpqa1-master/${resourceId}",
        "artifactUrlDuration" => "1.day"
      }
    }
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword'
}