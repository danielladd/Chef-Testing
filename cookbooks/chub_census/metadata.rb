name             'chub_census'
maintainer       'Kyle Titus'
maintainer_email 'ktitus@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures chub_census'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

supports "ubuntu"
depends "apt"
depends "chub_java"
depends "hostsfile"

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

attribute "graphite/host", :required => "recommended"
attribute "graphite/port", :required => "optional"
