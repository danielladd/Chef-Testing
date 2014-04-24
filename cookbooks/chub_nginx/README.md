chub_nginx Cookbook
===================
CommerceHub overrides / implementations of sites hosted on NGINX



Requirements
------------

#### packages
- `nginx` - Lots of providers, but not always as helpful as it could be

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### chub_nginx::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chub_nginx']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### chub_nginx::default
Includes some defaults and will install nginx, but not run your site.

What you should really do is create a recipe for your site, and `depends 'chub_nginx'` at the beginning.

Just include `chub_nginx` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub_nginx]"
  ]
}
```

#### chub_nginx::_sample_static_site.rb
Do not run this recipe.  If you need to serve a basic static-files site (html,
css, javascript), Copy this file to a new recipe, update the three variables at the top of the
recipe (name, index, and repo), and add the recipe to your server's runlist.

#### chub_nginx::_sample_php_site.rb
Identical in purpose to the _sample_static_site except that you want to serve
php content.  Likewise, you will not run this recipe; you are to copy this file
to a new recipe, update the top three variables, and use that recipe.

#### chub_nginx::styleguide
This is the recipe that serves the [StyleGuide.](http://styleguide.nexus.commercehub.com)
Originally an example of the _sample_static_site, it was later converted to a
php site.

#### chub_nginx::corpsite
This is the new version of the [Corporate Website.](http://www.commercehub.com)



License and Authors
-------------------
Authors:

* H. "Waldo" Grunenwald
* David Carr