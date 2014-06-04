default[:chub_slm_fulfillment][:jar_url] = "http://bamboom1:8085/artifact/SLM-ENGB/JOB1/build-latestSuccessful/shadowJars/slm-fulfillment/build/distributions/slm-fulfillment-2.0.0-m0-SNAPSHOT-shadow.jar?os_username=mess&os_password=messuser"
default[:chub_slm_fulfillment][:java_heap_size] = "512M"

default[:chub_slm_fulfillment][:intervals_db_jar] = "http://bamboom1:8085/artifact/SLM-ENGB/JOB1/build-latestSuccessful/jars/slm-fulfillment/databases/intervals/build/libs/intervals-db-ratchet.jar?os_username=mess&os_password=messuser"
default[:chub_slm_fulfillment][:intervals_db_name] = "slm_fulfillment_intervals"

default[:chub_slm_fulfillment][:exceptions_db_jar] = "http://bamboom1:8085/artifact/SLM-ENGB/JOB1/build-latestSuccessful/jars/slm-fulfillment/databases/exceptions/build/libs/exceptions-db-ratchet.jar?os_username=mess&os_password=messuser"
default[:chub_slm_fulfillment][:exceptions_db_name] = "slm_fulfillment_exceptions"

default[:chub_slm_fulfillment][:measurements_db_jar] = "http://bamboom1:8085/artifact/SLM-ENGB/JOB1/build-latestSuccessful/jars/slm-fulfillment/databases/measurements/build/libs/measurements-db-ratchet.jar?os_username=mess&os_password=messuser"
default[:chub_slm_fulfillment][:measurements_db_name] = "slm_fulfillment_measurements"

default[:chub_slm_fulfillment][:db_server] = "SQLVM03"
default[:chub_slm_fulfillment][:db_user] = "devusr1"
default[:chub_slm_fulfillment][:db_pass] = "usrdev"