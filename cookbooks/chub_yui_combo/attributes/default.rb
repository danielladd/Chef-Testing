#Don't enable the default nginx site.
override[:nginx][:default_site_enabled] = false

#Whether or not to export combo assets from a git repo
default[:yui_combo][:git_export_enabled] = false

#Git Repo containing assets to make available to the combohandler
default[:yui_combo][:git_repo] = ""

#The routes that the combohandler will serve
default[:yui_combo][:routes] = [
	"yui"
]
