#class User < ApplicationRecord
#end

class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true

  has_and_belongs_to_many :recipes
  # has_secure_password

end
