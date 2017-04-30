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

require 'test_helper'

class UserCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
