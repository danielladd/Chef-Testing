# chub_pipeline cookbook

A cookbook for installing sensu in the way that we need it for Pipeline.

This cookbook uses Chef searches, so you can't fully test it with Vagrant and Chef Solo.

To test with [Test Kitchen](http://kitchen.ci/), run `kitchen test all`.  
But think about doing this because I haven't written any tests

# Requirements

# Usage
This cookbook is the Pipeline team cookbook.  Currently it wraps the chub_sensu cookbook and deploys both client and server nodes monitored in sensu by the pipeline team.  This cookbook contains examples of wrapping both server and client recipes.  

# Attributes

# Recipes

# Author

Author:: Larry Zarou (lzarou@commercehub.com)

