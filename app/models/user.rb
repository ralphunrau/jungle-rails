class User < ApplicationRecord

  has_secure_password
  
  validates :password_confirmation, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates_length_of :password, :minimum => 8

  def self.authenticate_with_credentials email, password
    @user = self.find_by_email(email)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
