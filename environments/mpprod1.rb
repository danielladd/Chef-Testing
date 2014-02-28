name "mpprod1"
description "marketplace production environment 1"
cookbook "chub-klerk", "= 0.10.3"
default_attributes "chub-klerk" => {
    "mongo_addresses" => [ "mdb01:27017", "mdb02:27017", "mdb03:27017" ],
    "quartz_database_url" => "jdbc:jtds:sqlserver://sqlps/Klerk_Quartz;user=Klerk_Admin;password=KAdminuser01!",
    "hazelcast_group_name" => "mpprod1_klerk",
    "hazelcast_group_password" => "dbYsD3PVD9HEpGbQ",
    "antivirus_hosts" => [ "vscan.commercehub.com" ],
    "event_notification_endpoints" => {
        "productstream" => "http://api.buyspace.com/klerk/productDataEvents"
    },
    "sprite_conductor_url" => "http://sprite.buyspace.com/sprite-conductor",
    "sprite_output_container_prefix" => "mpprod1-"
},
'chub-buyspace' => {
	'imageUploading' => {
		'amazon' => {
			'accessKey' => 'AKIAJK63J4IFXXGB7RYA',
			'secretKey' => '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',
        	'bucket' => 'commercehub-sprite-mpprod1-uploaded',
			'duration' => '1.days'
		}
	},
	'sprite' => {
		'conductorApiUrl' => 'http://sprite.buyspace.com/sprite-conductor',
		'outputContainerPrefix' => 'mpprod1-',
		'imageUrlTemplate' => 'http://d3k3ht6exf8iib.cloudfront.net/mpprod1-watermarked/${resourceId}-watermark-${size}-${size}.jpg'
	},
	'klerk' => {
		'url' => 'http://klerk.commercehub.com:8090'
	},
	'useGoogleAnalytics' => 'true',
	'useHubSpot' => 'true',
	'marketplace' => {
		'gitRevision' => 'System.currentTimeMillis()'
	},
		'files' => {
			'commerceHubRelationshipsFile' => "/marketplace/rels.csv"
		},
	'adminEmailAddress' => 'lrotter@commercehub.com',
	'paymentFailureEmailAddress' => 'paymentissues@buyspace.com',
	'creSecure' => {
		'cardTokenValidationUrl' => 'https://direct.cresecure.net/direct/services/validation'
	},
	'antivirus' => {
		'hosts' => ['vscan.commercehub.com'],
		'enabled' => 'true',
		'port' => '1344'
	},
	'grails' => {
		'serverURL' => "https://www.buyspace.com",
		'serverURLbyHostname' => "http://wapp02.commercehub.com:8080",
		'apiServerURL' => "http://api.commercehub.com",
		'plugin' => {
			'excludes' => 'null'
		}
	},
	'msExchangeApi' => {
		'url' => "https://mymail.commercehub.com/ews/Exchange.asmx",
		'credentials' => {
			'username' => 'buyspace',
			'password' => '1buySp@ce'
		}
	},
	'hornetq' => {
		'host' => 'mq01.commercehub.com',
		'port' => '5445'
	},
	'taskScheduler' => {'enabled' => 'true'},
	'bestBuyMarketplace.retailerId' => '51247477c519e3a71e639634',
	'mongo' => {
		'databaseName' => "marketplaceProd",
		'replicas' => ['mdb01.commercehub.com', 'mdb02.commercehub.com', 'mdb03.commercehub.com']
	},
	'images' => {
		'graphicsMagickHome' => '/marketplace/software/GraphicsMagick',
		'baseDirectory' => '\\\\imagefs02\\images',
		'productBaseDirectory' => "${baseDirectory}\\products",
		'serverUrls' => ['https://s1.buyspace.com'],
		'datastoreDirectories' => ['\\\\imagefs01\\image-datastore', '\\\\imagefs03\\image-datastore'],
		'productImageAttachmentStrategy' => 'local'
	},
	'solr' => {
		'url' => 'http://search01.commercehub.com:8080/solr/'
	},
	'salesforce' => {
		'url' => 'https://na1.salesforce.com',
		'apiUrl' => "${salesforce.url}/services/data/v24.0",
		'clientId' => '3MVG99OxTyEMCQ3jLWU2aXrHra9IH.vcatnvgH6L4x4kiIDyvjLQuuBfIZVKPLPRA_qFWCRNaLkBB32KOnLzT',
		'clientSecret' => '3939258714251867600',
		'httpClient' => {
			'connectionsPerRoute' => '10',
			'totalConnections' => '100'
		},
		'password' => 'hAhE4awR',
		'tokenUrl' => 'https://login.salesforce.com/services/oauth2/token',
		'username' => 'buyspace@buyspace.com'
	},
	'sugar' => {
		'restUrl' => 'https://chub.sugarondemand.com/service/v2/rest.php',
		'username' => 'frankpny',
		'password' => 'f33df3aa9450daed583ce2756a5fc9f1',
		'uiUrl' => 'https://chub.sugarondemand.com/index.php?action=DetailView&module=Accounts&record='
	},
	'log4j' => {

	},
	'beans' => {
		'shiroSecurityManager' => {
			'rememberMeManager' => 'null'
		}
	},
	'vertx' => {
		'enabled' => 'false',
		'hazelcastConfigFile' => '/marketplace/hazelcast/cluster.xml',
		'hostname' => 'wapp02',
		'port' => '25500'
	}
}
