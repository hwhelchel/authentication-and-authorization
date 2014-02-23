get '/users/new' do
  unless loggedin?
    erb :"users/new"
  else
    redirect '/'
  end
end

post '/users' do
  unless loggedin?
    User.create(params)
    redirect '/'
  else
    redirect back
  end
end

post '/users/login' do
  unless loggedin?
    login
  else
    redirect back
  end
end

delete '/users/logout' do
  if loggedin?
    logout
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


