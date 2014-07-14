# yui_combo-cookbook

Installs NodeJS and the "combohandler" npm package.
Configures the "combohandler" as an Upstart service.
Configures nginx for response caching.

## Supported Platforms

Ubuntu 12.04+

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nginx']['default_site_enabled']</tt></td>
    <td>Boolean</td>
    <td>Override from the nginx cookbook. We don't need the default site.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['yui_combo']['git_repo']</tt></td>
    <td>String</td>
    <td>URL to a Git repository containing the YUI Source and a routes.json file.</td>
    <td><tt>https://git.nexus.commercehub.com/JDipierro/yui-combo-resources.git</tt></td>
  </tr>
</table>

## Usage

### yui_combo::default

Include `yui_combo` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[yui_combo::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-yui_combo-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: CommerceHub Inc. (<jdipierro@commercehub.com>)
