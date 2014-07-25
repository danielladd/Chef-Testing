name "mpdev_alex"
description "alex dev environment"
cookbook "base", "= 0.1.16"
cookbook "chub-klerk", "= 1.0.1"
cookbook "chub-buyspace", "= 0.6.0"
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
},"chub-buyspace" => {
  "mongo" => {
    "databaseName" => "marketplaceProd",
    "replicas" => ['mdb01.commercehub.com', 'mdb02.commercehub.com', 'mdb03.commercehub.com'],
    "blobstoreDatabaseName" => "marketplaceProd",
    "blobstoreReplicas" => ['mdb01.commercehub.com', 'mdb02.commercehub.com', 'mdb03.commercehub.com']
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
    #"serverURL" => "https://mpqa2-buyspace.commercehub.com",
    #"apiServerURL" => "https://mpqa2-buyspace.commercehub.com"
     "serverURL" => "https://www.buyspace.com",
     "apiServerURL" => "http://api.commercehub.com"
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
  "images" => {
    "datastoreDirectories" => "'\\\\imagefs01\\image-datastore', '\\\\imagefs03\\image-datastore'",
    "baseDirectory" => '\\\\imagefs02\\images',
    "productBaseDirectory" => "/var/buyspace/images/products" ,
    "serverUrls" => "https://s1.buyspace.com",
    "shareDirectory" => "//mpqa02.nexus.commercehub.com/images_qa7",
    "shareMount" => "/var/buyspace/images/",
    "shareUser" => "mpqatomcat",
    "sharePassword" => "MarketPl@ce"
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
  "files" => {
      "dailyBillingEventLocation" => '\\\\\\\\imagefs01\\\\datatransfer\\\\productstream\\\\billing'
  },
},
'tomcat' => {
  'base_version' => 7,
  'loglevel' => 'WARN',
  'keystore_password' => 'throwawaypassword',
  'truststore_password' => 'throwawaypassword' 
}


#  'marketplace' => {
#    'gitRevision' => 'System.currentTimeMillis()'
#  },
#    'files' => {
#      'commerceHubRelationshipsFile' => "/marketplace/rels.csv"
#    },
#  'adminEmailAddress' => 'lrotter@commercehub.com',
#  'paymentFailureEmailAddress' => 'paymentissues@buyspace.com',
#  'taskScheduler' => {'enabled' => 'true'},
#  'bestBuyMarketplace.retailerId' => '51247477c519e3a71e639634',
#  'log4j' => {

#  },
#  'beans' => {
#    'shiroSecurityManager' => {
#      'rememberMeManager' => 'null'
#    }
#  }
  