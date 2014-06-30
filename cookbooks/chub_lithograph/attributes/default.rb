default[:chub_lithograph][:app_url] = "http://bamboom1:8085/browse/ODD-LIT/latestSuccessful/artifact/shared/lithograph/Lithograph-standalone.jar?os_username=mess&os_password=messuser"
default[:chub_lithograph][:java_heap_size] = "512M"

#The following attributes should be moved to an encrypted data bag before going live.
default[:chub_lithograph][:db_user] = "devusr01"
default[:chub_lithograph][:db_pass] = "usrdev"
default[:chub_lithograph][:db_name] = "lithographdev1_lith"