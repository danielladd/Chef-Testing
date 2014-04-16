require 'spec_helper'

describe 'chub_envdash::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
  end
  it 'includes oracle java 8' do
    expect(chef_run).to include_recipe('chub_java::oracle8')
  end

end
