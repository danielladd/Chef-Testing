#Don't enable the default nginx site.
override[:nginx][:default_site_enabled] = false

#Git Repo containing js/css files to make available to the combo server, as well as the routes.json file.
default[:yui_combo][:git_repo] = "https://git.nexus.commercehub.com/JDipierro/yui-combo-resources.git"

default[:yui_combo][:routes] = {
	"/combo/yui" => "/var/combo/yui"
}
