#class User < ApplicationRecord
#end

class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 64}
  # Regex expression for email for validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 256}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}

  has_and_belongs_to_many :recipes
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
