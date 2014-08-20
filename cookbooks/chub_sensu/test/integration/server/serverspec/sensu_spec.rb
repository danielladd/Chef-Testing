require 'spec_helper'

# Sensu
describe service('sensu-server') do
 it { should be_enabled }
 it { should be_running }
end

describe service('sensu-api') do
 it { should be_enabled }
 it { should be_running }
end

describe service('sensu-client') do
 it { should be_enabled }
 it { should be_running }
end

describe file('/etc/sensu/config.json') do
  it { should be_file }
  it { should contain(/.*"host": "localhost"/).from(/.*rabbitmq/).to(/.*redis/) }
  it { should contain(/.*"port": 5672/).from(/.*rabbitmq/).to(/.*redis/) }
  it { should contain(/.*"host": "localhost"/).from(/.*redis/).to(/.*api/) }
  it { should contain(/.*"port": "6379"/).from(/.*redis/).to(/.*api/) }
  it { should contain(/.*"host": "localhost"/).from(/.*api/).to(/^}/) }
  it { should contain(/.*"port": 4567/).from(/.*api/).to(/^}/) }
end


# Uchiwa Sensu Dashboard
describe service('uchiwa') do
 it { should be_enabled }
 it { should be_running }
end

describe port(3000) do
  it { should be_listening }
end

describe file('/etc/sensu/uchiwa.json') do
  it { should be_file }
  it { should contain(/.*"host": "0.0.0.0"/).from(/.*uchiwa/).to(/.*sensu/) }
  it { should contain(/.*"port": 3000/).from(/.*uchiwa/).to(/.*sensu/) }
  it { should contain(/.*"host": "localhost"/).from(/.*sensu/).to(/^}/) }
  it { should contain(/.*"port": 4567/).from(/.*sensu/).to(/^}/) }
end
