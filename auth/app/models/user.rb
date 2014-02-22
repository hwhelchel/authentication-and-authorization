class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates_presence_of :email
  # validates_format_of :email, with: EMAIL_REGEX, on: :create

  include BCrypt

  def password
    @password ||= Password.new(hash_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hash_password = @password
  end

  def create_encrypt(params)
    @user = User.new(params[:user])
    @user.password = params[:new_password]
    @user.save!
  end

  
end
