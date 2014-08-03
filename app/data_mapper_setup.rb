env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
require_relative './models/user'
require_relative './models/post'
DataMapper.finalize