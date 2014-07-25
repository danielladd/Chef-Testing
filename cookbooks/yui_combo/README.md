# yui_combo-cookbook

Installs NodeJS and the "combohandler" npm package.
Configures the "combohandler" as an Upstart service.
Configures nginx for response caching.

## Supported Platforms

Ubuntu 12.04+

## Attributes

| Key | Type | Description | Default |
|---|---|---|---|
| ['nginx']['default_site_enabled'] | Boolean | Override from the nginx cookbook. We don't need the default site. | false |
| ['yui_combo']['git_repo'] | String | URL to a Git repository containing the YUI Source and a routes.json file. | https://git.nexus.commercehub.com/JDipierro/yui-combo-resources.git |

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