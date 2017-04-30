# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  subject    :string
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# UserComments are anonymous comments that allow users to give feedback on the
# Pantri service.

class UserComment < ApplicationRecord
	validates :subject, presence: true, length: { minimum: 4 }
	validates :comment, presence: true, length: { minimum: 10 }
end
