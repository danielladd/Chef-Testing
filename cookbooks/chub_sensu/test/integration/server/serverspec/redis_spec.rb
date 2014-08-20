require 'spec_helper'

# Redis
describe service('redis6379') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end

# Redis Sentinel
describe service('redis_sentinel_sensu') do
 it { should be_enabled }
 it { should be_running }
end

describe port(26379) do
  it { should be_listening }
end
