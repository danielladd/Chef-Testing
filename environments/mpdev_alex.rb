name "mpdev_alex"
description "alex dev environment"
cookbook "chub-klerk", "= 1.0.1"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa03:27777", "mpqa05:27777" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa1_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa1_klerk",
    "hazelcast_group_password" => "mpqa1_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "product_data_event_endpoints" => {
        "productstream" => "http://mpqa01.nexus.commercehub.com:17070/klerk/productDataEvents"
    },
    "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
    "sprite_conductor_url" => "http://mpqa05.nexus.commercehub.com:8080/sprite-conductor",
    "sprite_output_container_prefix" => "mpqa1-",
    "jms_provider_url" => "jnp://mpqa03.nexus.commercehub.com:7099"
},
"chub-buyspace" => {
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
    "host" => "mpqa03.nexus.commercehub.com",
    "port" => 7447
  },
  "taskScheduler" => {
    "enabled" => false
  },
  "grails" => {
    "serverURL" => "http://mpalex:8080",
    "apiServerURL" => "http://mpalex:8080"
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
  },
  "images" => {
    "serverUrls" => ["https://qa-vip7.buyspace.com/static-images"],
    "datastoreDirectories" => "'/var/buyspace/images/datastore/images1', '/var/buyspace/images/datastore/images2'",
    "baseDirectory" => '/var/buyspace/images',
    "productBaseDirectory" => "/var/buyspace/images/products" ,
    "serverUrls" => "https://mpqa1-buyspace.commercehub.com/static-images"
  }  
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword' 
}