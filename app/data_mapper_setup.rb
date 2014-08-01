env = ENV["RACK_ENV"] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require_relative './models/user'
require_relative './models/post'
DataMapper.finalize
DataMapper.auto_upgrade!