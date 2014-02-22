class User < ActiveRecord::Base

  validates :email, presence: true
  validates_format_of :email, with: /@/, on: :create

  # include BCrypt

  # def password
  #   @password ||= Password.new(hash_password)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.hash_password = @password
  # end

  
end
