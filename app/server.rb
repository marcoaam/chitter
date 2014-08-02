require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'bcrypt'

use Rack::Flash
enable :sessions
set :session_secret, 'super secret'
set :root, File.join(File.dirname(__FILE__), '..')
set :views, Proc.new { File.join(root, 'app/views/') }

require_relative 'data_mapper_setup'

require_relative './helpers/application'
require_relative './models/user'
require_relative './models/post'

require_relative './controllers/application'
require_relative './controllers/user_management'
require_relative './controllers/posts'

