default[:chub_oddrest][:app_url] = "http://bamboom1:8085/browse/ODD-ORS/latestSuccessful/artifact/shared/odd-rest-service/odd-rest-service-standalone.jar?os_username=mess&os_password=messuser"
default[:chub_oddrest][:java_heap_size] = "512M"

#The following attributes should be moved to an encrypted data bag before going live.
default[:chub_oddrest][:db_user] = "devusr01"
default[:chub_oddrest][:db_pass] = "usrdev"
default[:chub_oddrest][:db_name] = "pcullen_dev_odd"