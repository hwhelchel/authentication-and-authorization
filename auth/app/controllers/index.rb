get '/' do
  unless loggedin?
    erb :index
  else
    redirect '/users'
  end
end
