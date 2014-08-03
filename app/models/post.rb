class Post

	include DataMapper::Resource

	property :id, 			Serial
	property :post, 		Text, 	length: 1..150
	property :picture, 	String

	belongs_to :user

	def self.reverse_order
		self.all.reverse
	end

end