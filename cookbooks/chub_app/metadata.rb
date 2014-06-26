name             'chub_app'
maintainer       'David M. Carr'
maintainer_email 'dcarr@commercehub.com'
license          'All rights reserved'
description      'Installs/Configures an app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "ubuntu"
depends "chub_java"

attribute "chub_app/app_url",
    :display_name => "Application URL",
    :description => "URL from which to obtain the application distribution; can use a remote URL",
    :required => "required"

attribute "chub_app/app_env",
    :display_name => "Application environment variables",
    :description => "Environment variables for the application",
    :required => "optional",
    :type => "hash",
    :default => {}

attribute "chub_app/app_args",
    :display_name => "Application arguments",
    :description => "Arguments for the application",
    :required => "optional",
    :type => "array",
    :default => []

attribute "chub_app/jvm_args",
    :display_name => "JVM arguments",
    :description => "Arguments for the JVM",
    :required => "optional",
    :type => "array",
    :default => []
