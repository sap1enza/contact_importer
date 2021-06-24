class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }

  has_many :imports

  before_save { self.email = email&.downcase }
end
