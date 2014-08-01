get '/users/new' do
	erb :"users/new"
end

post '/users/new' do
	@user = User.create(:username => params[:username],
											:name => params[:name],
											:email => params[:email],
											:password => params[:password],
											:password_confirmation => params[:password_confirmation]
											)
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :"users/new"
	end
end

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