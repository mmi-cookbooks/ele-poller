name 'ele-poller'
maintainer 'Rackspace'
maintainer_email 'sfo-devops@lists.rackspace.com'
license 'Apache 2.0'
description 'Installs/Configures ele-poller'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version begin
  IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
rescue
  '0.1.0'
end

if respond_to?(:source_url)
  source_url 'https://github.com/mmi-cookbooks/ele-poller-chef'
end
if respond_to?(:issues_url)
  issues_url 'https://github.com/mmi-cookbooks/ele-poller-chef/issues'
end

supports 'ubuntu'

depends 'apt'
