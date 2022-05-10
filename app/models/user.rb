class User < ApplicationRecord

  has_secure_password
  
  validates :password_confirmation, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}

end
