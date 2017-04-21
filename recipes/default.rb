include_recipe 'apt::default'

apt_repository 'cloudmonitoring' do
  uri node['poller']['repo']['baseurl']
  distribution 'cloudmonitoring'
  components ['main']
  key node['poller']['repo']['gpgkey']
  only_if { node['poller']['repo']['managed'] }
end

%w(rackspace-monitoring-poller).each do |p|
  package p
end

template '/etc/rackspace-monitoring-poller.cfg' do
  owner node['poller']['owner']
  group node['poller']['group']
  mode 0o0644
  variables(
    monitoring_token: node['poller']['monitoring_token'],
    monitoring_id: node['poller']['monitoring_id'],
    monitoring_private_zones: node['poller']['monitoring_private_zones']
  )
  source 'rackspace-monitoring-poller.cfg.erb'
  notifies :restart, 'service[rackspace-monitoring-poller]'
end

template '/etc/default/rackspace-monitoring-poller' do
  owner 'root'
  group 'root'
  mode 0o0644
  variables(
    enabled: node['poller']['enabled']
  )
  source 'rackspace-monitoring-poller.erb'
  notifies :restart, 'service[rackspace-monitoring-poller]'
end

service 'rackspace-monitoring-poller' do
  supports restart: true, status: true
  action [:enable, :start]
end
