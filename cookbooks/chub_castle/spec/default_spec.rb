require 'spec_helper'

describe 'chub_castle::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
  end
  it 'includes oracle java 8' do
    expect(chef_run).to include_recipe('chub_java::oracle8')
  end

  context 'with environment' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
        env = Chef::Environment.new
        env.name 'myenv'
        node.stub(:chef_environment).and_return(env.name)
        Chef::Environment.stub(:load).and_return(env)
      end.converge(described_recipe)
    end
    it 'uses a default hazelcast group based on the environment' do
      expect(chef_run.node[:chub_castle][:hazelcast][:group]).to eq('myenv-castle')
    end
  end

end
