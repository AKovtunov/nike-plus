require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'nikeplus_api' 
require 'vcr'
CONFIG = YAML.load_file("lib/config/token.yml") unless defined? CONFIG
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<TOKEN>') do
  	CONFIG['TOKEN']
  end
end
RSpec.configure do |config|
	config.treat_symbols_as_metadata_keys_with_true_values = true
end