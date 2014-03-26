name             'chub-census'
maintainer       'Kyle Titus'
maintainer_email 'ktitus@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub-census-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

supports "ubuntu"
depends "apt"
depends "java", "~> 1.22.0"

attribute "chub-census/app_url",
    :display_name => "census application URL",
    :description => "URL from which to obtain the application JAR; can use a remote URL",
    :required => "optional",
    :default => "http://mpbamboo.nexus.commercehub.com/browse/SSO-CEN/latestSuccessful/artifact/shared/census-shadow.jar/census-shadow.jar"

attribute "chub-census/java_heap_size",
    :display_name => "census Java heap size",
    :description => "The heap size with which to run the census JVM",
    :required => "optional",
    :default => "512M"

attribute "chub-census/database/url", :required => "required"
attribute "chub-census/database/user", :required => "required"
attribute "chub-census/database/password", :required => "required"

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"
