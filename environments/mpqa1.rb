name "mpqa1"
description "marketplace qa environment 1"
cookbook "base", "= 0.1.16"
cookbook "chub-klerk", "= 5.0.0"
cookbook "chub-buyspace", "= 0.10.1"
default_attributes "chub-klerk" => {
    "mongo_uri" => "mongodb://mpqa03.nexus.commercehub.com:27777,mpqa05.nexus.commercehub.com:27777/?maxPoolSize=50&maxIdleTimeMS=300000",
    "blobstore_mongo_uri" => "mongodb://mpqa03.nexus.commercehub.com:27777,mpqa05.nexus.commercehub.com:27777/?maxPoolSize=50&maxIdleTimeMS=300000",
    "hazelcast_group_name" => "mpqa1_klerk",
    "hazelcast_group_password" => "mpqa1_klerk",
    "antivirus_hosts" => [ "qa-scanengine.commercehub.com" ],
    "product_data_event_endpoints" => {
        "productstream" => "http://mpqa1-api.nexus.commercehub.com/klerk/productDataEvents"
    },
    "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
    "dead_product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventDLQ",
    "sprite_conductor_url" => "http://mpqa05.nexus.commercehub.com:8080/sprite-conductor",
    "sprite_output_container_prefix" => "mpqa1-",
    "sprite_notification_id" => "klerk",
    "sprite_manifest_update_notification_endpoint" => "jms:queue:KlerkSPRITEManifestUpdateNotificationQueue",
    "jms_provider_url" => "jnp://mpqa03.nexus.commercehub.com:7099"
},
"chub-buyspace" => {
  "mongo" => {
    "databaseName" => "marketplaceProd_91212bak",
    "replicas" => ['mpqa05.nexus.commercehub.com:27777', 'mpqa03.nexus.commercehub.com:27777'],
    "blobstoreDatabaseName" => "marketplaceProd_91212bak_blobStore",
    "blobstoreReplicas" => ['mpqa05.nexus.commercehub.com:27777', 'mpqa03.nexus.commercehub.com:27777']
  },
  "security" => {
    "shiro" => {
      "authc" => {
        "required" => false
      },
      "realm" => "mongodb",
      "cas" => {
        "serverUrl" => "https://ssoint1-apps.nexus.commercehub.com/account",
        "serviceUrl" => "https://mpqa1-buyspace.nexus.commercehub.com/shiro-cas",
        "failureUrl" => "https://mpqa1-buyspace.nexus.commercehub.com/auth/fail"
      }
    }
  },
  "census" => {
    "url" => "https://ssoint1-census.nexus.commercehub.com:8443",
    "buyspaceAndProductStreamApplicationId" => "buyspaceandproductstream-qa1"
  },
  "plaza" => {
    "url" => "https://ssoint1-apps.nexus.commercehub.com/user"
  },
  "vault" => {
    "url" => "https://ssoint1-vault.nexus.commercehub.com:8443"
  },
  "solr" => {
    "url" => "http://mpqa03:7070/solr/"
  },
  "klerk" => {
    "url" => "http://mpqa1-klerk.nexus.commercehub.com:8090"
  },
  "hornetq" => {
    "host" => "mpqa03.nexus.commercehub.com",
    "port" => 7447
  },
  "taskScheduler" => {
    "enabled" => false
  },
  "grails" => {
    "serverURL" => "https://mpqa1-buyspace.nexus.commercehub.com",
    "apiServerURL" => "http://mpqa1-api.nexus.commercehub.com"
  },
  "webServerUrl"=> "https://mpqa1-buyspace.nexus.commercehub.com",
  "antivirus" => {
    "hosts" => "['qa-scanengine.commercehub.com']",
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
  "semantics3" => {
    "apiKey" => "SEM38CAF563E5A1AC8A94D902EDABF2B07A1",
    "apiSecret" => "YjI5YmQ0OTIyNTEwZjA4MjQyNGFhYzZhODZjZGZjZGE"
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
  "log4j" => {
    "root_loglevel" => 'info',
    "redis_server_host" => "mplogs01.nexus.commercehub.com"
  },
  "environment_level" => "testing",
  "cdn" => {
    "sharePath" => "//mpqa02.nexus.commercehub.com/images_qa7",
    "mountPath" => "/var/buyspace/images/cdn",
    "shareUser" => "mpqatomcat",
    "sharePassword" => "MarketPl@ce"
  },
  "imageDatastore1" => {
    "sharePath" => "//mpqa02.nexus.commercehub.com/images_qa7/datastore/images1",
    "mountPath" => "/var/buyspace/images/datastore-1",
    "shareUser" => "mpqatomcat",
    "sharePassword" => "MarketPl@ce"
  },  
  "imageDatastore2" => {
    "sharePath" => "//mpqa02.nexus.commercehub.com/images_qa7/datastore/images2",
    "mountPath" => "/var/buyspace/images/datastore-2",
    "shareUser" => "mpqatomcat",
    "sharePassword" => "MarketPl@ce"
  },  
  "dataTransfer" => {
    "sharePath" => "//mpqa02.nexus.commercehub.com/images_qa7/datatransfer",
    "mountPath" => "/var/buyspace/data-transfer",
    "shareUser" => "mpqatomcat",
    "sharePassword" => "MarketPl@ce"
  },  
  "forSaleImport" => {
    "pendingDir" => "/var/buyspace/data-transfer/forSale",
    "inProgressDir" => "/var/buyspace/data-transfer/forSale/processing",
    "doneDir" => "/var/buyspace/data-transfer/forSale/archived"
  },
  "files" => {
    "dailyBillingEventLocation" => '/var/buyspace/data-transfer/productstream/billing',
    "hubPartnerStatisticsFile" => '/var/buyspace/data-transfer/commercehub/partner-statistics/incoming/latest/vendorscorecard.txt'
  },
  "images" => {
      "datastoreDirectories" => "'/var/buyspace/images/datastore-1', '/var/buyspace/images/datastore-2'",
      "baseDirectory" => '/var/buyspace/images/cdn',
      "productBaseDirectory" => "/var/buyspace/images/cdn/products" ,
      "serverUrls" => "https://mpqa1-buyspace.nexus.commercehub.com/static-images"
  },  
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword' 
}
