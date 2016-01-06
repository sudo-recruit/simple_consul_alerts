include_recipe "apt"

include_recipe "golang::default"
node.default['go']['packages'] = [ "github.com/AcalephStorage/consul-alerts"]
include_recipe "golang::packages"

poise_service_user 'consul_alerts'
data_dir= '/var/lib/consul_alerts'
directory data_dir do
  recursive true
  owner 'consul_alerts'
  group 'consul_alerts'
  mode '0755'
end

poise_service 'consul_alerts' do
  command '/usr/bin/env consul-alerts start --watch-events --watch-checks --log-level=info'
  user 'consul_alerts'
  directory data_dir
  environment PATH:'/opt/go/bin:/usr/local/bin:/usr/bin:/bin'
end