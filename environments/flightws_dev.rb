name "flightws_dev"
description "A linux machine running flight WS (in dev)"
cookbook_versions({
	"chub_mc_webservice" => "= 0.1.0"
})
default_attributes(
    "chub_mc_webservice" => {
   		"jar_file_name" => "flight-service-standalone.jar",
		"jar_file_url" => "http://artifactory01/artifactory/inteng-snapshot/com/commercehub/flightws/0.1/flight-service-standalone.jar",
		"flight_config" => {
			"setupDatabase" =>{
				"serverName" => "sqlisdemo",
				"user" => "isdemo",
				"password" => "isrocksondemo",
				"databaseName" => "partnersetup"
			}, 
			"testDatabase" =>{
				"serverName" => "sqlvm03",
				"user" => "regusr01",
				"password" => "usrreg",
				"databaseName" => "dorderstreamtes_sb"
			},
			"prodDatabase" =>{
				"serverName" => "sqlvm03",
				"user" => "regusr01",
				"password" => "usrreg",
				"databaseName" => "dorderstream_sb"
			},
			"pGen" => {
				"templateSourcePath" => "//morpheus/autoproc$/plg_templates_prod/templates.jar",
				"autoprocRootPath" => "//dorderstream/autoprocess/partners", 
				"ftpRootPath" => "//dorderstream/autoprocess/partners/ftptest"
			},



			# "swaggerConfiguration": {
   #      		"version": "1.0.0",
   #      		"basePath": "http://localhost:8080"
   #  		},
   #  		"logging": {
   #      		"appenders": [
   #          		{
   #              "type": "file",
   #              "currentLogFilename": ".\\flightws.log",
   #              "archivedLogFilenamePattern": ".\\flightws-%d.log.gz",
   #              "archivedFileCount": "7",
   #              "timeZone": "US/Eastern"
   #          			}
   #      		]
   #  }



		}
	}
)

