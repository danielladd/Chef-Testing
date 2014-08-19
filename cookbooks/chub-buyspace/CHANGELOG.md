chub-buyspace CHANGELOG
=======================

This file is used to list changes made in each version of the chub-buyspace cookbook.

0.10.1
------
- Andrew Blick - Fixed issue where an environment without YUI config would not properly default to using a local YUI installation.

0.10.0
-----
- Alex Heiss - First pass scripts to gracefully take down & bring up, a node.

0.9.0
-----
- Andrew Blick - Added YUI combo configuration.

0.8.0
-----
- Dave "Jazz" Jaskolka - Added SSO configuration.

0.4.1
-----
- Anton Beza - Updated adminEmailAddress.

0.4.0
-----
- Andrew Blick - Added "for sale" import configuration.

0.2.0
-----
- H. "Waldo" Grunenwald - Changing dependency from java to chub_java. Updating the Vagrantfile to current guidelines. Minor cleanup.

0.1.2
-----
- Matt Hurne - Default value of ['chub-buyspace']['antivirus']['hosts'] attribute is now 'vscan.commercehub.com'

0.1.1
-----
- H. "Waldo" Grunenwald - Adding the self-removal mechanism to the upgrade 
("recipe[chub-buyspace::upgrade_buyspace]"") and rollback 
("recipe[chub-buyspace::specific_build]") recipes

0.1.0
-----
- H. "Waldo" Grunenwald - Initial release of chub-buyspace

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
