get '/' do
	@posts = Post.reverse_order
	erb :index
end