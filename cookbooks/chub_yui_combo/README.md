# yui_combo-cookbook

Installs NodeJS and the "combohandler" npm package.
Configures the "combohandler" as an Upstart service.
Configures nginx for response caching.

## Supported Platforms

Ubuntu 12.04+

## Attributes

| Key | Type | Description | Default |
|---|---|---|---|
| [:nginx][:default_site_enabled] | Boolean | Override from the nginx cookbook. We don't need the default site. | false |
| [:yui_combo][:git_export_enabled] | Boolean | Whether or not to export combo assets from a git repo. | false |
| [:yui_combo][:git_repo] | String | URL to a Git Repo containing assets to make available to the combohandler. | "" |
| [:yui_combo][:routes] | [String] | List of routes that the combohandler will server | ["yui"] |

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

### Downloading YUI releases
To download a YUI release (e.g. 3.16.0) and install it so that it can be served by the combo server, execute the following command:

`sudo download_yui.sh 3.16.0`

### Clearing the nginx cache
To clear nginx's cache, execute the following command:

`sudo clear_nginx_cache.sh`

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-yui_combo-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: CommerceHub Inc. (<jdipierro@commercehub.com>)