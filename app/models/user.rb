# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# You can make an account, which is stored as a User in the database. A User can
# save/unsave recipes to their account and not much else.

class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 64}
  # Regex expression for email for validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 256}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}

  has_and_belongs_to_many :recipes
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Use bcrypt to convert a string password into a securely hashed password.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
