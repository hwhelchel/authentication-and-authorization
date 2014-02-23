class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates_presence_of :email, :password_hash, on: :create
  validates_uniqueness_of :email, allow_blank: false
  validates_format_of :email, with: EMAIL_REGEX, on: :create

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    @user = User.new(params[:user])
    @user.hash_password(params[:password])
    @user.save!
  end

  def hash_password(new_password)
    self.password = new_password
  end
  
end
