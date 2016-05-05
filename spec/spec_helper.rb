ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require './models/link'
require './models/tag'
require './models/user'
require 'database_cleaner'
require 'web_helper'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = BM

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Also can be done with...(combines before/after)
  # config.around(:each) do |example|
  #   DatabaseCleaner.cleaning do
  #     example.run
  #   end
  # end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
