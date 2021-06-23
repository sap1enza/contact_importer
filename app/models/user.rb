class User < ApplicationRecord
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_secure_password

  validates :password, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, uniqueness: { case_sensitive: false }

  before_save { self.email = email&.downcase }
end
