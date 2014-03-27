openldap Cookbok CHANGELOG
==========================
This file is used to list changes made in each version of the openldap cookbook.

v1.12.15
-------
- add ulimit to /etc/default/slapd based on [632314](https://bugs.launchpad.net/ubuntu/+source/openldap2.3/+bug/632314)

v1.12.14
-------
- add prod ssl certs

v1.12.13
-------
- change dos line endings to unix

v1.12.12
-------
- added support to the vagrant slpad.conf file to automatically store plaintext passswords as sha512

v1.12.11
-------
- disable tls for the replication for now; it wasn't working for ssoqa1?

v1.12.10
-------
- add certs for ssoqa1 environment

v1.12.9
-------
- enable LDAPS

v1.12.8
-------
- add support for SHA-2

v1.12.7
-------
- fix references to recipes due to cookbook rename

v1.12.6
-------
- fix mirror configuration logic

v1.12.5
-------
- first chub version (earlier versions are opscode versions)
- add self-signed certs for ldap(01,02).vagrant.dev, ssodev1ldap(1,2).nexus.commercehub.com
- add support for "mirror" recipe
- use db5.1-util rather than db4.8-util (this is the version of BerkleyDB that appears to actually be used these days)
- for now, increase the logging
- add a retry config for replication

v1.12.4
-------

- [COOK-3772] - nscd clears don't work
- [COOK-411]  - Openldap authentication should validate server certificate


v1.12.2
-------
### Improvement
- **[COOK-3699](https://tickets.opscode.com/browse/COOK-3699)** - OpenLDAP Cookbooks - add extra options


u tv0.12.0
-------
### New Feature
- **[COOK-3561](https://tickets.opscode.com/browse/COOK-3561)** - Support out of band SSL certificates in openldap::server

### Bug
- **[COOK-3548](https://tickets.opscode.com/browse/COOK-3548)** - Fix an issue where preseeding may fail if directory does not exist
- **[COOK-3543](https://tickets.opscode.com/browse/COOK-3543)** - Do not try to set up as a slave
- **[COOK-3351](https://tickets.opscode.com/browse/COOK-3351)** - Fix a typo in `ldap-ldap.conf.erb` template


v0.11.4
-------
### Bug
- **[COOK-3348](https://tickets.opscode.com/browse/COOK-3348)** - Fix typo in default attributes

v0.11.2
-------
### Bug
- [COOK-2496]: openldap: rootpw is badly set in attributes file
- [COOK-2970]: openldap cookbook has foodcritic failures

v0.11.0
-------
- [COOK-1588] - general cleanup/improvements
- [COOK-1985] - attributes file has a search method

v0.10.0
-------
- [COOK-307] - create directory with attribute

v0.9.4
-------
- Initial/Current release
