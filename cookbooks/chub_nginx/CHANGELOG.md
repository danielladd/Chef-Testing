chub_nginx CHANGELOG
=======================

This file is used to list changes made in each version of the chub-buyspace cookbook.

0.2.0
-----

* 'H. "Waldo" Grunenwald' - Fixing the rsync job to work properly.  Was missing a trailing slash in the source (so it was copying as a subfolder of the destination), making the destination deletes recursive, and being more explicit about paths.


0.1.8
-----

* 'H. "Waldo" Grunenwald' - Pointing the styleguide and corpsite to the new git server

0.1.7
-----

* 'H. "Waldo" Grunenwald' - Ensuring that the phpinfo site doesn't exist in non-Vagrant environs

0.1.6
-----

* 'H. "Waldo" Grunenwald' - Converting styleguide to a php/fcgi site.

0.1.5
-----

* 'H. "Waldo" Grunenwald' - Fixing removal of files in all standard sites and samplesites. Minor cleanup

0.1.4
-----

* 'H. "Waldo" Grunenwald' - Adding php/fcgi to Corpsite, and a _sample_php_site example recipe.  Minor cleanup of other recipes.

0.1.3
-----

* David M. Carr - Add defaultsite recipe.

0.1.2
-----

* 'H. "Waldo" Grunenwald' - Refactor to a single simple_static_site template.

0.1.1
-----

* 'H. "Waldo" Grunenwald' - Basic serving of CorpSite (doesn't serve PHP).  Fixes file ownership of sites so they are owned by www-data

0.1.0
-----

*	H. "Waldo" Grunenwald - Initial release of chub_nginx, serving CHUB StyleGuide.

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
