require 'spec_helper'

# Define installed packages
Packages = {
  'filebeat' => {
    version: '6.7.1'
  },
  'metricbeat' => {
    version: '6.7.1'
  },
  'heartbeat-elastic' => {
    version: '6.7.1'
  },
  'packetbeat' => {
    version: '6.7.1'
  },
  'auditbeat' => {
    version: '6.7.1'
  },
  'elasticsearch' => {
    version: '6.7.1'
  },
  'logstash' => {
    version: '1:6.7.1-1'
  },
  'kibana' => {
    version: '6.7.1'
  },
  'osquery' => {
    version: '3.3.2-1.linux'
  }
}

# Define Installed services
InstalledServices = [
  'filebeat',
  'metricbeat',
  'heartbeat-elastic',
  'packetbeat',
  'auditbeat',
  'elasticsearch',
  'logstash',
  'kibana',
  'osqueryd'
]

# Define Active services
ActiveServices = [
  'filebeat',
  'metricbeat',
  'heartbeat-elastic',
  'packetbeat',
  'auditbeat',
  'elasticsearch',
  'logstash',
  'kibana',
  'osqueryd',
  'elastalert'
]



# https://www.singlestoneconsulting.com/articles/writing-efficient-infrastructure-tests-with-serverspec
# Verify packages
Packages.each do |name, details|
  describe package(name) do
    it { should be_installed.with_version(details[:version]) }
  end
end

# Verify services
InstalledServices.each do |name|
  describe service(name) do
    it { should be_enabled }
  end
end

# Verify services
ActiveServices.each do |name|
  describe service(name) do
    it { should be_running }
  end
end

describe port(22) do
  it { should be_listening }
end
