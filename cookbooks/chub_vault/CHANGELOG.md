# 0.4.1
* Change read and write bind user to readrole and writerole. Removes the admin user from the write binding. 

# 0.4.0
* Add support for archaius configuration
* Bind against LDAP write pool, not read pool; to avoid replication delay for password resets

# 0.3.5
* Remove apt dependency (base cookbook should ensure apt is appropriately updated)
* Remove hostsfile tweaks (base cookbook should provide those when needed)

# 0.3.4
* Make vault group append
* Update Berksfile/Vagrantfile to work with latest versions of Berkshelf/Vagrant

# 0.3.3
* Use chub_java cookbook

# 0.3.2

* Fix a typo in the template

# 0.3.1

* Update configuration for healthcheck (cn -> username)
* Update default healtcheck UID to be a valid UUID

# 0.3.0

* Change configuration of LDAP pools

# 0.2.2

* Enable remote JMX
* Increase default heap size to 1G

# 0.2.1

* Increase the maximum number of open file descriptors

# 0.2.0

* Make base DN and test information configurable
* Restructure attributes used

# 0.1.9

* Remove extra stuff from old java install approach
* Misc. cleanup
* Enforce minimum java cookbook version in cookbook metadata

# 0.1.8

* Correct spacing in config file

# 0.1.7

* Try to recover from whatever craziness happened and reset back to the desired code

# 0.1.5

* Update metrics config to syntax for DropWizard 0.7.x

# 0.1.4

* Add database config

# 0.1.3

* Add non-app-specific graphite config

# 0.1.2

* Inline all variables into the template
* Always use LDAPS

# 0.1.1

* Add support for configuring ldap_read_host and search_password
* For now, disable TLS rather than getting self-signed certs to work; it's unclear if we'll be using it or switching to LDAPS

# 0.1.0

* Initial version
