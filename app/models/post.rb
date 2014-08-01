class Post

	include DataMapper::Resource

	property :id, Serial
	property :post, Text

	belongs_to :user

end