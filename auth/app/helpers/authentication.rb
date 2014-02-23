helpers do
  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      give_token
    end
      redirect '/'
  end

  def loggedin?
    !!session[:id]
  end

  def give_token
    session[:id] = @user.id
  end

end
