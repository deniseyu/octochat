env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/octochat_#{env}")

DataMapper.finalize 

DataMapper.auto_upgrade!
