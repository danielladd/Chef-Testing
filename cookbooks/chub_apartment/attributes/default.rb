default[:chub_apartment][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/apartment/%5BRELEASE%5D/apartment-%5BRELEASE%5D.jar"

###
# App Config Details
#
# Many of these settings should be overridden in the appropriate environment.
#
###

# DB
default[:chub_apartment][:db][:server] = "SQLVM03"
default[:chub_apartment][:db][:port] = "1433"
default[:chub_apartment][:db][:name] = "odddev1_chub"
default[:chub_apartment][:db][:userName] = "devusr01"
default[:chub_apartment][:db][:pass] = "usrdev"

default[:chub_apartment][:db][:showSql] = false
default[:chub_apartment][:db][:formatSql] = false
default[:chub_apartment][:db][:generateDdl] = false

default[:chub_apartment][:db][:maxIdle] = 8
default[:chub_apartment][:db][:maxActive] = 8
default[:chub_apartment][:db][:minIdle] = 4
default[:chub_apartment][:db][:maxWait] = 5000
default[:chub_apartment][:db][:removeAbandoned] = true
default[:chub_apartment][:db][:removeAbandonedTimeout] = 60
default[:chub_apartment][:db][:defaultAutoCommit] = true
default[:chub_apartment][:db][:defaultReadOnly] = false
default[:chub_apartment][:db][:validationQuery] = "select 1"
default[:chub_apartment][:db][:testOnBorrow] = true
default[:chub_apartment][:db][:testOnReturn] = false
default[:chub_apartment][:db][:testWhileIdle] = false
default[:chub_apartment][:db][:timeBetweenEvictionRunsMillis] = -1
default[:chub_apartment][:db][:numTestsPerEvictionRun] = 3
default[:chub_apartment][:db][:minEvictableIdleTimeMillis] = 1800000