get '/posts/create' do
	user = User.first(:id => session[:user_id])
	if user
		erb :"posts/create"
	else
		flash[:notice] = 'Sorry you must be signed in order to have access to this webpage'
		redirect to('/')
	end
end

post '/posts/create' do
	if @picture_name != ""
		Post.create(:post 		=> params[:post_text],
								:user_id  => session[:user_id],
								:picture  => params[:picture_name])
	else
		Post.create(:post 		=> params[:post_text],
								:user_id  => session[:user_id])
	end
		redirect to('/')
end

get '/filter/:user' do
	user = User.first(:username => params[:user])
	@posts = Post.all(:user_id 	=> user.id).reverse_order
	erb :"filter/posts"
end