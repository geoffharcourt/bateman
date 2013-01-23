require 'simplecov'
SimpleCov.start

require 'bateman'

require 'rspec/autorun'
require 'fakeweb'
require './spec/support/prepare_html.rb'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end