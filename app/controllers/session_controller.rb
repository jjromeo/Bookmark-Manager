class BookmarkManager <Sinatra::Base
	get '/sessions/new' do 
		haml :"sessions/new"
	end

	post '/sessions/new' do 
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect to('/')
		else
			flash[:errors] = ["The email or password is incorrect"]
			haml :"sessions/new"
		end
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash[:notice] = "Good bye!"
		redirect to('/')
	end

	get '/sessions/forgot' do 
		haml :"/sessions/forgot"
	end

	post '/sessions/forgot' do 
	end

end