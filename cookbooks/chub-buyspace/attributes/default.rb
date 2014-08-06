
default['tomcat']['base_version']             = 7
default['chub-buyspace']['config_dir']		= '/etc/buyspace'
# # Use these when Buyspace includes an embedded Tomcat
# default['chub-buyspace']['user']			= 'buyspace'
# default['chub-buyspace']['group']			= 'buyspace'
# default['chub-buyspace']['app_dir']			= '/opt/buyspace'
# default['chub-buyspace']['log_dir']			= '/var/log/buyspace'
# default['chub-buyspace']['data_dir']		= '/var/buyspace'
# default['chub-buyspace']['temp_dir']		= '/tmp/buyspace'
default['chub-buyspace']['app_dir']			= node['tomcat']['webapp_dir']
default['chub-buyspace']['user']			= node['tomcat']['user']
default['chub-buyspace']['group']			= node['tomcat']['group']
default['chub-buyspace']['log_dir']			= '/var/log/buyspace'
default['chub-buyspace']['data_dir']		= '/var/buyspace'
default['chub-buyspace']['temp_dir']		= '/tmp/buyspace'
default['chub-buyspace']['buyspace_conf']	= 'buyspace-config.groovy'
default['chub-buyspace']['logging_conf']	= 'logging.properties'
default['chub-buyspace']['staged_war_name']  = 'staged-buyspace.war'
default['chub-buyspace']['images_dir'] = '/var/buyspace/images'

# These should be overridden
default['chub-buyspace']['grails_env']		= 'local'

###
# App Config Details
#
# Many of these settings should be overridden in the appropriate environment.
# The following keywords were used:
# 	-localhost
# 	-testing
# 	-PLACEHOLDER
###

# Email Things
default['chub-buyspace']['adminEmailAddress'] = 'testing@localhost.com'
default['chub-buyspace']['msExchangeApi']['url'] = "https://localhost"
default['chub-buyspace']['msExchangeApi']['credentials']['username'] = 'PLACEHOLDER'
default['chub-buyspace']['msExchangeApi']['credentials']['password'] = 'PLACEHOLDER'
default['chub-buyspace']['msExchangeApi']['overrideAddress'] = 'productstream-testing@commercehub.com'
default['chub-buyspace']['paymentFailureEmailAddress'] = 'testing@localhost.com'

# The rest is alphabetical
default['chub-buyspace']['census']['url'] = 'https://ssoint1-census.nexus.commercehub.com:8443'
default['chub-buyspace']['census']['buyspaceAndProductStreamApplicationId'] = 'buyspaceandproductstream-dev'

default['chub-buyspace']['channelProductExporter']['imageUrlStrategy']['accessKey'] = 'PLACEHOLDER'
default['chub-buyspace']['channelProductExporter']['imageUrlStrategy']['secretKey'] = 'PLACEHOLDER'
default['chub-buyspace']['channelProductExporter']['imageUrlStrategy']['bucketName'] = 'PLACEHOLDER'
default['chub-buyspace']['channelProductExporter']['imageUrlStrategy']['keyTemplate'] = 'mpprod1-master/${resourceId}'
default['chub-buyspace']['channelProductExporter']['imageUrlStrategy']['artifactUrlDuration'] = '1.day'

default['chub-buyspace']['antivirus']['host'] = 'localhost'
default['chub-buyspace']['antivirus']['hosts'] = ['vscan.commercehub.com']
default['chub-buyspace']['antivirus']['enabled'] = false
default['chub-buyspace']['antivirus']['port'] = 1344
  
default['chub-buyspace']['log4j']['redis_server_host'] = 'mplogs01.nexus.commercehub.com'

default['chub-buyspace']['beans']['shiroSecurityManager']['rememberMeManager'] = "null"
default['chub-buyspace']['bestBuyMarketplace']['retailerId'] = '51247477c519e3a71e639634'
default['chub-buyspace']['creSecure']['cardTokenValidationUrl'] = 'https://localhost/direct/services/validation'

default['chub-buyspace']['environment_level'] = 'development'

default['chub-buyspace']['files']['dailyBillingEventLocation'] = 'PLACEHOLDER'  

default['chub-buyspace']['forSaleImport']['pendingDir'] = "PLACEHOLDER"
default['chub-buyspace']['forSaleImport']['inProgressDir'] = "PLACEHOLDER"
default['chub-buyspace']['forSaleImport']['doneDir'] = "PLACEHOLDER"
 
default['chub-buyspace']['grails']['serverURL'] = "https://localhost"
default['chub-buyspace']['grails']['serverURLbyHostname'] = "http://localhost:8080"
default['chub-buyspace']['grails']['apiServerURL'] = "http://localhost:8080"
default['chub-buyspace']['grails']['plugin']['excludes'] = "null"
  
default['chub-buyspace']['hornetq']['host'] = 'localhost'
default['chub-buyspace']['hornetq']['port'] = 5445
   
default['chub-buyspace']['cdn']['sharePath'] = "//mpqa02.nexus.commercehub.com/images_qa7"
default['chub-buyspace']['cdn']['mountPath'] = "#{node['chub-buyspace']['images_dir']}/cdn"
default['chub-buyspace']['cdn']['shareUser'] = "mpqatomcat"
default['chub-buyspace']['cdn']['sharePassword'] = "MarketPl@ce"

default['chub-buyspace']['imageDatastore1']['sharePath'] = "//mpqa02.nexus.commercehub.com/images_qa7/datastore/images1"
default['chub-buyspace']['imageDatastore1']['mountPath'] = "#{node['chub-buyspace']['images_dir']}/datastore-1"
default['chub-buyspace']['imageDatastore1']['shareUser'] = "mpqatomcat"
default['chub-buyspace']['imageDatastore1']['sharePassword'] = "MarketPl@ce"

default['chub-buyspace']['imageDatastore2']['sharePath'] = "//mpqa02.nexus.commercehub.com/images_qa7/datastore/images2"
default['chub-buyspace']['imageDatastore2']['mountPath'] = "#{node['chub-buyspace']['images_dir']}/datastore-2"
default['chub-buyspace']['imageDatastore2']['shareUser'] = "mpqatomcat"
default['chub-buyspace']['imageDatastore2']['sharePassword'] = "MarketPl@ce"

default['chub-buyspace']['dataTransfer']['sharePath'] = "//mpqa02.nexus.commercehub.com/images_qa7/datatransfer"
default['chub-buyspace']['dataTransfer']['mountPath'] = "/var/buyspace/data-transfer"
default['chub-buyspace']['dataTransfer']['shareUser'] = "mpqatomcat"
default['chub-buyspace']['dataTransfer']['sharePassword'] = "MarketPl@ce"
  
default['chub-buyspace']['images']['graphicsMagickHome'] = '/usr/bin'
default['chub-buyspace']['images']['baseDirectory'] = "#{node['chub-buyspace']['cdn']['mountPath']}"
default['chub-buyspace']['images']['productBaseDirectory'] = "#{node['chub-buyspace']['cdn']['mountPath']}/products"

default['chub-buyspace']['images']['serverUrls'] = ['https://localhost']
  
default['chub-buyspace']['images']['datastoreDirectories'] = "/var/buyspace/images/datastore/images1"
default['chub-buyspace']['images']['productImageAttachmentStrategy'] = 'local'
  
default['chub-buyspace']['imageUploading']['amazon']['accessKey']	= 'PLACEHOLDER'
default['chub-buyspace']['imageUploading']['amazon']['secretKey']	= 'PLACEHOLDER'
default['chub-buyspace']['imageUploading']['amazon']['bucket']		= 'commercehub-sprite-mpprod1-uploaded'
default['chub-buyspace']['imageUploading']['amazon']['duration']	= '1.hours'
  
default['chub-buyspace']['klerk']['url'] = 'http://localhost:8090'
default['chub-buyspace']['log4j']['root_loglevel'] = 'info'
  
default['chub-buyspace']['marketplace']['files']['commerceHubRelationshipsFile'] = "/marketplace/rels.csv"
default['chub-buyspace']['marketplace']['gitRevision'] = 'System.currentTimeMillis()'
  
default['chub-buyspace']['mongo']['databaseName'] = "marketplaceTest"
#default['chub-buyspace']['mongo']['replicas'] = ['localhost']
default['chub-buyspace']['mongo']['blobstoreDatabaseName'] = "marketplaceTest"
#default['chub-buyspace']['mongo']['blobstoreReplicas'] = ['localhost']

default['chub-buyspace']['plaza']['url'] = 'https://ssoint1-apps.nexus.commercehub.com/user'

default['chub-buyspace']['salesforce']['url'] = 'https://localhost'
default['chub-buyspace']['salesforce']['apiUrl'] = "node['chub-buyspace']['salesforce']['url']/services/data/v24.0"
default['chub-buyspace']['salesforce']['clientId'] = 'PLACEHOLDER'
default['chub-buyspace']['salesforce']['clientSecret'] = 'PLACEHOLDER'
default['chub-buyspace']['salesforce']['httpClient']['connectionsPerRoute'] = 10
default['chub-buyspace']['salesforce']['httpClient']['totalConnections'] = 100
default['chub-buyspace']['salesforce']['password'] = 'PLACEHOLDER'
default['chub-buyspace']['salesforce']['tokenUrl'] = 'https://localhost/services/oauth2/token'
default['chub-buyspace']['salesforce']['username'] = 'buyspace@buyspace.com'

default['chub-buyspace']['security']['shiro']['authc']['required'] = false
default['chub-buyspace']['security']['shiro']['realm'] = 'mongodb'
default['chub-buyspace']['security']['shiro']['cas']['serverUrl'] = 'https://ssoint1-apps.nexus.commercehub.com/account'
default['chub-buyspace']['security']['shiro']['cas']['serviceUrl'] = 'http://localhost:8080/shiro-cas'
default['chub-buyspace']['security']['shiro']['cas']['failureUrl'] = 'http://localhost:8080/auth/fail'

default['chub-buyspace']['semantics3']['apiKey'] = 'PLACEHOLDER'
default['chub-buyspace']['semantics3']['apiSecret'] = 'PLACEHOLDER'
  
default['chub-buyspace']['solr']['url'] = 'http://localhost:8080/solr/'
  
default['chub-buyspace']['sprite']['conductorApiUrl'] = 'http://localhost/sprite-conductor'
default['chub-buyspace']['sprite']['outputContainerPrefix'] = 'testing-'
default['chub-buyspace']['sprite']['imageUrlTemplate'] = 'http://localhost/mpprod1-watermarked/${resourceId}-watermark-${size}-${size}.jpg'
default['chub-buyspace']['sprite']['productImageSpriteManifestWritingEnabled'] = false
default['chub-buyspace']['sprite']['pendingSpriteManifestPostingEnabled'] = false

default['chub-buyspace']['sugar']['uiUrl'] = 'https://localhost/index.php?action=DetailView&module=Accounts&record='
default['chub-buyspace']['taskScheduler']['enabled'] = true
default['chub-buyspace']['useGoogleAnalytics'] = false
default['chub-buyspace']['useHubSpot'] = false

default['chub-buyspace']['vault']['url'] = 'https://ssoint1-vault.nexus.commercehub.com:8443'

default['chub-buyspace']['vertx']['enabled'] = false
default['chub-buyspace']['vertx']['hazelcastConfigFile'] = '/marketplace/hazelcast/cluster.xml'
default['chub-buyspace']['vertx']['hostname'] = 'localhost'
default['chub-buyspace']['vertx']['port'] = 25500
  
default['chub-buyspace']['webServerUrl'] = 'http://localhost:8080'

default['chub-buyspace']['yui']['seedUrl'] = 'PLACEHOLDER'
default['chub-buyspace']['yui']['comboBase'] = 'PLACEHOLDER'
default['chub-buyspace']['yui']['filter'] = 'min'
default['chub-buyspace']['yui']['combine'] = true
