ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|

  # RSpec automatically cleans stuff out of backtraces;
  # sometimes this is annoying when trying to debug something e.g. a gem
  puts "                      ATTENTION: Backtraces are scoped to app code only."
  puts "                                 Edit spec_helper to debug all code"
  config.backtrace_clean_patterns = [
      /\/lib\d*\/ruby\//,
      /bin\//,
      /gems/,
      /spec\/spec_helper\.rb/,
      /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]

  config.mock_with :rspec

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Only run specs marked with :focus in metadata or all specs if none with :focus is found.
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

    # Requires supporting ruby files with custom matchers and macros, etc,
    # in spec/support/ and its subdirectories.
    Dir["./spec/support/**/*.rb"].each {|f| require f}
  
  config.include Devise::TestHelpers, :type => :controller

  config.before(:each) do
    
    # load factories each time, classes are not being cached
    load 'support/factories.rb'

    Rails.cache.clear
  end


  # Allows us to use build(...) instead of FactoryGirl.build(...)
  config.include FactoryGirl::Syntax::Methods
end
