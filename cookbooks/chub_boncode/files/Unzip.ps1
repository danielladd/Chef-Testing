param([string] <%= node[:chub_boncode][:install_location] %>,[string] <%= node[:chub_boncode][:version] %>)

[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | out-null
[System.IO.Compression.ZipFile]::ExtractToDirectory("<%= node[:chub_boncode][:install_location] %>\BonCodeAJP13_<%= node[:chub_boncode][:version] %>.zip","<%= node[:chub_boncode][:install_location] %>\BonCode\")