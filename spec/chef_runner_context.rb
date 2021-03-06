require 'rspec/core/shared_context'

# this is a 'standard' chef run, with no overrides
module ChefRun
  extend RSpec::Core::SharedContext

  let(:chef_run) do
    ChefSpec::ServerRunner.new.converge(described_recipe)
  end
end

# the following are commented out to save memory
# they show how you can set up alternate Chef Runners that
# override the node's chef environment or other attributes
# module ChefRunTestEnv
#   extend RSpec::Core::SharedContext
#
#   let(:chef_run) do
#     ChefSpec::ServerRunner.new do |node, server|
#       server.create_environment('unix_chef_client_upgrade-test')
#       node.chef_environment = 'unix_chef_client_upgrade-test'
#       server.create_node(node)
#     end.converge(described_recipe)
#   end
# end
#
# # a chef run where node attributes are overriden
# module ChefRunOverrideAttrs
#   extend RSpec::Core::SharedContext
#
#   let(:chef_run) do
#     ChefSpec::ServerRunner.new do |node|
#       node.set['unix_chef_client_upgrade']['foobar'] = true
#     end.converge(described_recipe)
#   end
# end
