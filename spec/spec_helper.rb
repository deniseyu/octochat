require './app/server.rb'
require 'database_cleaner'
require 'capybara/rspec'
require 'sinatra/partial'
require 'launchy'

ENV["RACK_ENV"] = 'test'

Capybara.app = Sinatra::Application.new 

RSpec.configure do |config|

  config.run_all_when_everything_filtered = true
  config.filter_run :focus 

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

  config.order = :random

end
