default[:chub_tattler][:app_url] = "http://bamboom1:8085/browse/ODD-TAT/latestSuccessful/artifact/shared/tattler/ODD-TAT-JOB1-standalone.jar?os_username=mess&os_password=messuser"

###
# App Config Details
#
# Many of these settings should be overridden in the appropriate environment.
#
###

# DB
default[:chub_tattler][:db][:server] = "SQLVM03"
default[:chub_tattler][:db][:name] = "tattlerdev1_tat"
default[:chub_tattler][:db][:userName] = "devusr01"
default[:chub_tattler][:db][:pass] = "usrdev"

default[:chub_tattler][:db][:showSql] = false
default[:chub_tattler][:db][:formatSql] = false
default[:chub_tattler][:db][:generateDdl] = false

default[:chub_tattler][:db][:maxIdle] = 8
default[:chub_tattler][:db][:maxActive] = 8
default[:chub_tattler][:db][:minIdle] = 4
default[:chub_tattler][:db][:maxWait] = 5000
default[:chub_tattler][:db][:removeAbandoned] = true
default[:chub_tattler][:db][:removeAbandonedTimeout] = 60
default[:chub_tattler][:db][:defaultAutoCommit] = true
default[:chub_tattler][:db][:defaultReadOnly] = false
default[:chub_tattler][:db][:validationQuery] = "select 1"
default[:chub_tattler][:db][:testOnBorrow] = true
default[:chub_tattler][:db][:testOnReturn] = false
default[:chub_tattler][:db][:testWhileIdle] = false
default[:chub_tattler][:db][:timeBetweenEvictionRunsMillis] = -1
default[:chub_tattler][:db][:numTestsPerEvictionRun] = 3
default[:chub_tattler][:db][:minEvictableIdleTimeMillis] = 1800000

# ODD
default[:chub_tattler][:odd][:baseUrl] = "http://odddev1-rest.nexus.commercehub.com:8080/"

# Exchange
default[:chub_tattler][:exchange][:ewsURL] = "https://mymail.commercehub.com/ews/Exchange.asmx"
default[:chub_tattler][:exchange][:ewsUser] = "tattler-test1"
default[:chub_tattler][:exchange][:ewsPassword] = "Password1"

# Misc
default[:chub_tattler][:email][:customerServiceEmailAddress] = "chostetter@gavant.com"
default[:chub_tattler][:cron][:default] = "0 */5 * * * *"