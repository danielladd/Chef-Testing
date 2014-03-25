execute 'clean_web_service_directory' do
	command "rm -fr #{node['tomcat']['webapp_dir']}/bootstrap"
	action :nothing
end

remote_file "#{node['tomcat']['webapp_dir']}/bootstrap.war" do
	source "http://bamboom1:8085/browse/MC-MCDEM/latest/artifact/shared/Inventory-Web-Service-demo/standalone.jar"
	owner "chub-missioncontrol"
	group "chub-missioncontrol"
	action :create_if_missing
	notifies :run, 'clean_web_service_directory', :immediately
	notifies :run, 'deploy_web_service_jar', :delayed
end

execute 'deploy_web_service_jar' do
	command "java -jar inventory-web-service-demo-standalone.jar -d"
	action :nothing
end