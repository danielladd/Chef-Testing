default[:chub_tattler][:app_url] = "http://bamboom1:8085/browse/ODD-TAT/latestSuccessful/artifact/shared/tattler/ODD-TAT-JOB1-standalone.jar?os_username=mess&os_password=messuser"
default[:chub_tattler][:java_heap_size] = "512M"

#The following attributes should be moved to an encrypted data bag before going live.
default[:chub_tattler][:db_user] = "devusr01"
default[:chub_tattler][:db_pass] = "usrdev"
default[:chub_tattler][:db_name] = "tattlerdev1_tat"