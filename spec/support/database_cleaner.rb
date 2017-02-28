require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :deletion
    # driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
    # if !driver_shares_db_connection_with_specs
    #   DatabaseCleaner.strategy = :truncation
    # end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
