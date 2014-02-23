get '/users/new' do
  unless loggedin?
    erb :"users/new"
  else
    redirect '/'
  end
end

post '/users' do
  unless loggedin?
    p params
    binding.pry
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    redirect '/'
  else
    redirect back
  end
end

post '/users/login' do
  unless loggedin?
    @user = User.find_by_email(params[:email])
    login
  else
    redirect back
  end
end

delete '/users/logout' do
  if loggedin?
    session.clear
    redirect '/'
  else
    redirect back
  end
end

get '/users' do
  if loggedin?
    @users = User.all
    erb :"users/list"
  else
    redirect back
  end
end


