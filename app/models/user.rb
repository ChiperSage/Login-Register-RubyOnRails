require 'bcrypt'

class User < ApplicationRecord
  # Ensure password is securely handled
  # has_secure_password
  
  attr_accessor :password_confirmation

  validates :username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validate :passwords_match

  before_save :hash_password

  def authenticate(password)
    BCrypt::Password.new(self[:password]) == password
  end

  private

  def passwords_match
    if password != password_confirmation
      errors.add(:password_confirmation, "Passwords do not match")
    end
  end

  def hash_password
    self.password = BCrypt::Password.create(password)
  end

end
