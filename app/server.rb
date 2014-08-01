require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative './controllers/application'

require_relative 'data_mapper_setup'
require_relative './models/user'
require_relative './models/post'

set :root, File.join(File.dirname(__FILE__), '..')
set :views, Proc.new { File.join(root, 'app/views') }