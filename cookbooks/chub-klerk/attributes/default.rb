#default["chub-klerk"]["app_url"] = "http://mpbamboo.nexus.commercehub.com/browse/BS-KLER/latestSuccessful/artifact/shared/app.jar/klerk-app-0.0.1-SNAPSHOT-shadow.jar"
default["chub-klerk"]["app_url"] = "file:///var/opt/klerk/staged-klerk-app.jar"
default["chub-klerk"]["klerk_database_name"] = "klerk"
default["chub-klerk"]["blobstore_database_name"] = "klerk_blobStore"
default["chub-klerk"]["java_heap_size"] = "512M"
default["java"]["oracle"]["accept_oracle_download_terms"] = true
default["java"]["install_flavor"] = "oracle"
default["java"]["jdk_version"] = "7"
# TODO: move this to base config?
default["authorization"]["sudo"]["groups"] = ["sudo"]
default["authorization"]["sudo"]["include_sudoers_d"] = true
default["authorization"]["sudo"]["sudoers_defaults"] = ["env_reset", "exempt_group=admin", 'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"']
