#0.1.16
* Changed openldap replication check to tolerate 4 failures instead of 2

#0.1.15
* Changed castle health check again

#0.1.14
* Changed castle health check

# 0.1.13
* Load sensu checks from chef cookbook rather than git repo

# 0.1.12

* Use community plugins from the mirror on git.nexus.commercehub.com

# 0.1.11

* Tweak the checks for system resources (disk, cpu, memory)

# 0.1.10

* Add health check for census
* Condense load balancer URL checks to be based on an attribute

# 0.1.9

* Fix syntax for adding handlers

# 0.1.8

* Add missing template file

# 0.1.7

* Add pagerduty integration
* Add checks for SSO load balancer endpoints
* Rename cookbook to chub_sensu_sso

# 0.1.6

* Fix check-ram path

# 0.1.5

* Add check-cpu and check-ram

# 0.1.4

* Make checks less sensitive

# 0.1.3

* Use default handler for all checks
* Allow 5 retries for openldap synch checks

# 0.1.2

* Add plaza monitoring
* Allow configuring email recipient via attribute

# 0.1.1

* Add openldap monitoring

# 0.1.0

* Initial version
