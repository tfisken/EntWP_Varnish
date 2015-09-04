require 'serverspec'
require 'net/ssh'
require 'tempfile'
require 'chefspec'
require 'chefspec/berkshelf'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

`vagrant up #{host}`

config = Tempfile.new('', Dir.tmpdir)
config.write(`vagrant ssh-config #{host}`)
config.close

options = Net::SSH::Config.for(host, [config.path])

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C' 

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

# Example Spec Helper File
#require 'chefspec'
#require 'chefspec/berkshelf'
RSpec.configure do |config|
 # run all specs when using a filter, but no spec match
 config.run_all_when_everything_filtered = true
 config.log_level = :error
 config.platform = 'centos'
 config.version = '6.6'
 config.color = true
 config.tty = true
 config.formatter = :documentation
 config.filter_run :focus => true
 config.run_all_when_everything_filtered = true
 config.expect_with :rspec do |c|
 c.syntax = :expect
 end
end
at_exit { ChefSpec::Coverage.report! }