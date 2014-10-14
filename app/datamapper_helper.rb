env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/octochat_#{env}")

require_relative './models/user'
require_relative './models/post'
require_relative './models/reply'

DataMapper.finalize 

DataMapper.auto_upgrade!
