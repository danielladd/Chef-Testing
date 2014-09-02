name             'chub_census'
maintainer       'Kyle Titus'
maintainer_email 'ktitus@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub_census'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

supports "ubuntu"
depends "chub_java"

attribute "chub_census/app_url",
    :display_name => "Census application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-CEN/latestSuccessful/artifact/shared/census-server-shadow.jar/census-server-shadow.jar"

attribute "chub_census/java_heap_size",
    :display_name => "Census Java heap size",
    :description => "The heap size with which to run the Census JVM",
    :required => "optional",
    :default => "512M"

attribute "chub_census/database/url", :required => "required"
attribute "chub_census/database/user", :required => "required"
attribute "chub_census/database/password", :required => "required"

attribute "chub_census/authentication/activedirectory/domain", :required => "optional"
attribute "chub_census/authentication/activedirectory/domain_controller", :required => "optional"
attribute "chub_census/authentication/activedirectory/required_groups", :required => "optional"
attribute "chub_census/authentication/cache_policy", :required => "optional"

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"

attribute "plaza/url",
	:display_name => "Plaza application URL",
	:description => "URL endpoint of the Plaza application",
	:required => "required"

attribute "vault/url",
    :display_name => "Vault application URL",
    :description => "URL endpoint of the Vault application",
    :required => "required"    

attribute "profileUpdateNotificationUrls", :required => "optional", :default => []
	