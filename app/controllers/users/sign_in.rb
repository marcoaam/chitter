get '/session/new' do
	erb :"session/new"
end

post '/session/new' do
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		redirect to('/')
	else
		flash[:errors] = ['Incorrect log in details please try again']
		erb :"session/new"
	end
end