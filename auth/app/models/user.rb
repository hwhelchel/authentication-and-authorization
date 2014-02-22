class User < ActiveRecord::Base
  validates :email, :hash_password, presence: true
  validates_format_of :email, with: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$./i, on: :create

  def password
    @password ||= Password.new(hash_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.new_password = @password
  end

  
end
