helpers do
  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      give_token
      session[:id] = @user.id
    end
      redirect '/'
  end

  def loggedin?
    !!session[:id]
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:new_password]
    @user.save!
  end


end
