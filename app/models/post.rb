class Post

	include DataMapper::Resource

	property :id, Serial
	property :post, Text

	belongs_to :user

	def self.reverse_order
		self.all.reverse
	end

end