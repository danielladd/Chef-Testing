name "mpqa2"
description "marketplace qa environment 2"
cookbook "base", "= 0.1.16"
cookbook "chub-klerk", "= 1.0.1"
cookbook "chub-buyspace", "= 0.2.3"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mpqa2db1:27017", "mpqa2db2:27017", "mpqa2db3:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlvm81/mpqa2_klerk_quartz;user=devusr01;password=usrdev",
    "hazelcast_group_name" => "mpqa2_klerk",
    "hazelcast_group_password" => "mpqa2_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "product_data_event_endpoints" => {
        "productstream" => "http://mpqa2app1.nexus.commercehub.com/klerk/productDataEvents"
    },
    "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
    "sprite_conductor_url" => "http://mpqa2sc1.nexus.commercehub.com:8060/sprite-conductor",
    "sprite_output_container_prefix" => "mpqa2-",
    "jms_provider_url" => "jnp://mpqa2db2.nexus.commercehub.com:1099"
},
"chub-buyspace" => {
  "mongo" => {
    "databaseName" => "marketplaceProd",
    "replicas" => ['mpqa2db1.nexus.commercehub.com', 'mpqa2db2.nexus.commercehub.com', 'mpqa2db3.nexus.commercehub.com'],
    "blobstoreDatabaseName" => "marketplaceProd",
    "blobstoreReplicas" => ['mpqa2db1.nexus.commercehub.com', 'mpqa2db2.nexus.commercehub.com', 'mpqa2db3.nexus.commercehub.com']
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
    "serverURL" => "https://mpqa2-buyspace.commercehub.com",
    "apiServerURL" => "https://mpqa2-buyspace.commercehub.com"
  },
  "webServerUrl"=> "http://mppq2app1.nexus.commercehub.com",
  "antivirus" => {
    "hosts" => "['qa-scanengine.commercehub.com']",
    "enabled" => true,
    "port" => 1344
  },
  "sprite" => {
      "conductorApiUrl" => "http://mpqa2sc1.nexus.commercehub.com:8060/sprite-conductor",
      "outputContainerPrefix" => "mpqa2-",
      "imageUrlTemplate" => "https://d1dck2g5brplz4.cloudfront.net/mpqa2-watermarked/${resourceId}-watermark-${size}-${size}.jpg"
  },
  "imageUploading" => {
    "amazon" => {
      "accessKey" => "AKIAJF6XZOGR4SWDDORQ",
      "secretKey" => "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",
      "bucket" => "commercehub-sprite-mpqa2-uploaded",
      "duration" => "1.day"
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
    "hostname" => "mpqa2app1",
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
    "datastoreDirectories" => "'/var/buyspace/images/datastore/images1', '/var/buyspace/images/datastore/images2'",
    "baseDirectory" => '/var/buyspace/images',
    "productBaseDirectory" => "/var/buyspace/images/products" ,
    "serverUrls" => "https://mpqa2-buyspace.commercehub.com/static-images",
    "shareDirectory" => "//mpqa02.nexus.commercehub.com/images_qa7",
    "shareMount" => "/var/buyspace/images/",
    "shareUser" => "mpqatomcat/",
    "sharePassword" => "MarketPl@ce"
  }  
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword' 
}
