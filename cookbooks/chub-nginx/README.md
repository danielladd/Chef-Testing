chub-nginx Cookbook
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
#### chub-nginx::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chub-nginx']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### chub-nginx::default
Includes some defaults and will install nginx, but not run your site.

What you should really do is create a recipe for your site, and `depends 'chub-nginx'` at the beginning.

Just include `chub-nginx` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub-nginx]"
  ]
}
```

#### chub-nginx::styleguide

#### chub-nginx::files



Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:

H. "Waldo" Grunenwald
