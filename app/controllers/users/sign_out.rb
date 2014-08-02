get '/users/sign-out' do
	session[:user_id] = nil
	flash[:notice] = 'Good bye!'
	redirect to('/')
end