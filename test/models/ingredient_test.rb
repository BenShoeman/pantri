# == Schema Information
#
# Table name: ingredients
#
#  id             :integer          not null, primary key
#  name           :string
#  times_searched :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
