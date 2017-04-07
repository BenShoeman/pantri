require 'test_helper'

# test "the truth" do
#   assert true
# end


class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "User", email: "user@user.com", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should have a name" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "shoud have an email" do
    @user.email = "   "
    assert_not @user.valid?
  end

end
