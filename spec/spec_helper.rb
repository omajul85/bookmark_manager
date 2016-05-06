ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'database_cleaner'
require './app/app'
require './app/models/link'
require './app/models/tag'
require './app/models/user'
require_relative 'helpers/session'

Capybara.app = BM

RSpec.configure do |config|

  config.include SessionHelpers

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
