name "mpprod1"
description "marketplace production environment 1"
cookbook "base", "= 0.1.16"
cookbook "chub-klerk", "= 5.1.0"
cookbook "chub-buyspace", "= 0.10.1"
default_attributes "chub-klerk" => {
    "mongo_uri" => "mongodb://mdb01:27017,mdb02:27017,mdb03:27017/?maxPoolSize=50&maxIdleTimeMS=300000",
    "blobstore_mongo_uri" => "mongodb://mdb01:27017,mdb02:27017,mdb03:27017/?maxPoolSize=50&maxIdleTimeMS=300000",
    "hazelcast_group_name" => "mpprod1_klerk",
    "hazelcast_group_password" => "dbYsD3PVD9HEpGbQ",
    "antivirus_hosts" => [ "vscan.commercehub.com" ],
    "product_data_event_endpoints" => {
        "productstream" => "http://api.buyspace.com/klerk/productDataEvents"
    },
    "product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventQueue",
	  "dead_product_data_application_metadata_update_job_finished_event_endpoint" => "jms:queue:KlerkProductDataApplicationMetadataUpdateJobFinishedEventDLQ",
	  "jms_provider_url" => "jnp://mq01.commercehub.com:1099",  
    "sprite_conductor_url" => "http://sprite.buyspace.com/sprite-conductor",
    "sprite_output_container_prefix" => "mpprod1-",
    "sprite_notification_id" => "klerk",
    "sprite_manifest_update_notification_endpoint" => "jms:queue:KlerkSPRITEManifestUpdateNotificationQueue",
    "logstash_appender" => {
        "host" => "mplogs02.nexus.commercehub.com",
        "key" => "logstash",
        "threshold" => "INFO",
        "pool" => {
            "maxTotal" => "10",
            "maxIdle" => "5",
            "minIdle" => "1",
            "testOnBorrow" => "true",
            "testOnReturn" => "true",
            "testWhileIdle" => "true",
            "blockWhenExhausted" => "false"
        },
        "layout" => {
            "userFields" => "app:klerk,env:mpprod1"
        }
    }
},
"chub-buyspace" => {
  "grails_env" => "prod",
  "mongo" => {
    "databaseName" => "marketplaceProd",
    "replicas" => ['mdb01.commercehub.com', 'mdb02.commercehub.com', 'mdb03.commercehub.com'],
    "blobstoreDatabaseName" => "marketplaceProd_blobStore",
    "blobstoreReplicas" => ['mdb01.commercehub.com', 'mdb02.commercehub.com', 'mdb03.commercehub.com']
  },
  "security" => {
    "shiro" => {
      "authc" => {
        "required" => false
      },
      "realm" => "sso",
      "cas" => {
        "serverUrl" => "https://apps.commercehub.com/account",
        "serviceUrl" => "https://www.buyspace.com/shiro-cas",
        "failureUrl" => "https://www.buyspace.com/auth/fail"
      }
    }
  },
  "census" => {
    "url" => "https://ssoprod1-census.commercehub.com:8443",
    "buyspaceAndProductStreamApplicationId" => "buyspaceandproductstream-prod"
  },
  "plaza" => {
    "url" => "https://apps.commercehub.com/user"
  },
  "vault" => {
    "url" => "https://ssoprod1-vault.commercehub.com:8443"
  },
  "solr" => {
    "url" => "http://search01.commercehub.com:8080/solr/"
  },
  "klerk" => {
    "url" => "http://klerk.commercehub.com:8090"
  },
  "hornetq" => {
    "host" => "mq01.commercehub.com",
    "port" => 5445
  },
  "taskScheduler" => {
    "enabled" => false
  },
  "grails" => {
    "serverURL" => "https://www.buyspace.com",
    "apiServerURL" => "http://api.buyspace.com"
  },
  "webServerUrl"=> "https://www.buyspace.com",
  "antivirus" => {
    "hosts" => "['vscan.commercehub.com']",
    "enabled" => true,
    "port" => 1344
  },
  "sprite" => {
    "conductorApiUrl" => "http://sprite.buyspace.com/sprite-conductor",
    "outputContainerPrefix" => "mpprod1-",
    "imageUrlTemplate" => "https://d3k3ht6exf8iib.cloudfront.net/mpprod1-watermarked/${resourceId}-watermark-${size}-${size}.jpg"
  },
  "imageUploading" => {
    "amazon" => {
      "accessKey" => "AKIAJK63J4IFXXGB7RYA",
      "secretKey" => "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",
      "bucket" => "commercehub-sprite-mpprod1-uploaded",
      "duration" => "1.days"
    }
  },
  "salesforce" => {
    "url" => "https://na1.salesforce.com",
    "apiUrl" => "${salesforce.url}/services/data/v24.0",
    "clientId" => "3MVG99OxTyEMCQ3jLWU2aXrHra9IH.vcatnvgH6L4x4kiIDyvjLQuuBfIZVKPLPRA_qFWCRNaLkBB32KOnLzT",
    "clientSecret" => "3939258714251867600",
    "httpClient" => {
      "connectionsPerRoute" => 10,
      "totalConnections" => 100
    },
    "password" => "hAhE4awR",
    "tokenUrl" => "https://login.salesforce.com/services/oauth2/token",
    "username" => "buyspace@buyspace.com"
  },
  "semantics3" => {
    "apiKey" => "SEM38CAF563E5A1AC8A94D902EDABF2B07A1",
    "apiSecret" => "YjI5YmQ0OTIyNTEwZjA4MjQyNGFhYzZhODZjZGZjZGE"
  },
  "vertx" => {
    'enabled' => 'false',
    'hazelcastConfigFile' => '/marketplace/hazelcast/cluster.xml',
    'port' => '25500'
  },
  "msExchangeApi" => {
    "url" => "https://prodmail.commercehub.com/ews/exchange.asmx",
    "credentials" => {
      "username" => "buyspace",
      "password" => "1buySp@ce"
    }
  },
  "channelProductExporter" => {
    "imageUrlStrategy" => {
      "accessKey" => "AKIAJWG26TGCWYDAEEKQ",
      "secretKey" => "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",
      "bucketName" => "commercehub-sprite-mpprod1-master",
      "keyTemplate" => "mpprod1-master/${resourceId}",
      "artifactUrlDuration" => "2.days"
    }
  },
  'useGoogleAnalytics' => 'true',
  'useHubSpot' => 'true',
  'creSecure' => {
    'cardTokenValidationUrl' => 'https://direct.cresecure.net/direct/services/validation'
  },
  "log4j" => {
    "root_loglevel" => 'warn',
    "redis_server_host" => "mplogs02.nexus.commercehub.com"
  },
  "environment_level" => "production",
  "cdn" => {
    "sharePath" => "//imagefs02.commercehub.com/images",
    "mountPath" => "/var/buyspace/images/cdn",
    "shareUser" => "mptomcat",
    "sharePassword" => "MarketPlaceT0mcat"
  },
  "imageDatastore1" => {
    "sharePath" => "//imagefs01.commercehub.com/image-datastore",
    "mountPath" => "/var/buyspace/images/datastore-1",
    "shareUser" => "mptomcat",
    "sharePassword" => "MarketPlaceT0mcat"
  },
  "imageDatastore2" => {
    "sharePath" => "//imagefs03.commercehub.com/image-datastore",
    "mountPath" => "/var/buyspace/images/datastore-2",
    "shareUser" => "mptomcat",
    "sharePassword" => "MarketPlaceT0mcat"
  },
  "dataTransfer" => {
    "sharePath" => "//imagefs01.commercehub.com/datatransfer",
    "mountPath" => "/var/buyspace/data-transfer",
    "shareUser" => "mptomcat",
    "sharePassword" => "MarketPlaceT0mcat"
  },
  "forSaleImport" => {
    "pendingDir" => "/var/buyspace/data-transfer/productstream/forSale",
    "inProgressDir" => "/var/buyspace/data-transfer/productstream/forSale/processing",
    "doneDir" => "/var/buyspace/data-transfer/productstream/forSale/archived"
  },
  "files" => {
    "dailyBillingEventLocation" => '/var/buyspace/data-transfer/productstream/billing',
    "hubPartnerStatisticsFile" => '/var/buyspace/data-transfer/commercehub/partner-statistics/incoming/latest/vendorscorecard.txt'
  },
  "images" => {
    "datastoreDirectories" => "'/var/buyspace/images/datastore-1', '/var/buyspace/images/datastore-2'",
    "baseDirectory" => '/var/buyspace/images/cdn',
    "productBaseDirectory" => "/var/buyspace/images/cdn/products" ,
    "serverUrls" => "https://s1.buyspace.com",
  },
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword'
}

