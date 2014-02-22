helpers do
  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.hash_password == params[:password]
      session[:id] = @user.id
    end
      redirect '/'
  end

  def loggedin?
    !!session[:id]
  end

end
