class Post

	include DataMapper::Resource

	property :id, 	Serial
	property :post, Text, length: 1..150

	belongs_to :user

	def self.reverse_order
		self.all.reverse
	end

end