get '/posts/create' do
	erb :"posts/create"
end

post '/posts/create' do
	user = User.first(:id => session[:user_id])
	Post.create(:post => params[:post_text],
							:user => user)
	redirect to('/')
end