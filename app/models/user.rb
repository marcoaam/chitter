class User

	include DataMapper::Resource

	property :id, Serial
	property :username, Text
	property :name, String
	property :email, String
	property :password, String

	has n, :posts

end