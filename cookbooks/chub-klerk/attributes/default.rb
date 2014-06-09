default["chub-klerk"]["app_url"] = "file:///var/opt/klerk/staged-klerk-app.jar"
default["chub-klerk"]["klerk_database_name"] = "klerk"
default["chub-klerk"]["blobstore_database_name"] = "klerk_blobStore"
default["chub-klerk"]["java_heap_size"] = "512M"
# TODO: move this to base config?
default["authorization"]["sudo"]["groups"] = ["sudo"]
default["authorization"]["sudo"]["include_sudoers_d"] = true
default["authorization"]["sudo"]["sudoers_defaults"] = ["env_reset", "exempt_group=admin", 'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"']
