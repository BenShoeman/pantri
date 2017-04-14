class UserComment < ApplicationRecord
	validates :subject, presence: true, length: { minimum: 4 }
	validates :comment, presence: true, length: { minimum: 10 }
end
