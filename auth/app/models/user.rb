class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  attr_accessor :pass
  validates_length_of :pass, minimum: 4, on: :create
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
    binding.pry
    @user = User.new(email: params[:email], pass: params[:password])
    @user.hash_password(params[:password])
    @user.save!
  end

  def hash_password(new_password)
    self.password = new_password
  end
  
end
