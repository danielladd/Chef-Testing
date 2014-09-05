default[:chub_oddrest][:app_url] = "http://artifactory01.nexus.commercehub.com/artifactory/libs-release/com/commercehub/oddservice/%5BRELEASE%5D/oddservice-%5BRELEASE%5D.jar"
default[:chub_oddrest][:java_heap_size] = "512M"
default[:chub_oddrest][:jmxremote_port] = 12000
default[:chub_oddrest][:properties_location] = "/etc/oddrest/orgDataDir.properties"
# DB
default[:chub_oddrest][:db][:server] = "SQLVM03"
default[:chub_oddrest][:db][:name] = "odddev1_odd"
default[:chub_oddrest][:db][:userName] = "devusr01"
default[:chub_oddrest][:db][:pass] = "usrdev"

default[:chub_oddrest][:db][:showSql] = false
default[:chub_oddrest][:db][:formatSql] = false
default[:chub_oddrest][:db][:generateDdl] = false

default[:chub_oddrest][:db][:minPoolSize] = 3
default[:chub_oddrest][:db][:maxPoolSize] = 15
default[:chub_oddrest][:db][:initialPoolSize] = 3
default[:chub_oddrest][:db][:acquireIncrement] = 3
default[:chub_oddrest][:db][:maxIdleTime] = 14400
default[:chub_oddrest][:db][:preferredTestQuery] = "select 1"
default[:chub_oddrest][:db][:idleConnectionTestPeriod] = 0
default[:chub_oddrest][:db][:testConnectionOnCheckin] = false
default[:chub_oddrest][:db][:testConnectionOnCheckout] = true
default[:chub_oddrest][:db][:maxStatementsPerConnection] = 15
default[:chub_oddrest][:db][:acquireRetryAttempts] = 5
default[:chub_oddrest][:db][:acquireRetryDelay] = 1000
default[:chub_oddrest][:db][:numHelperThreads] = 3

default[:slm][:graphite][:host] = "stats02.nexus.commercehub.com"
default[:slm][:graphite][:port] = "2003"
