require 'test_helper'

# test "the truth" do
#   assert true
# end


class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "User", email: "user@user.com", password: "monkey", password_confirmation: "monkey")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should have a name" do
    # If username is blank, user is not valid
    @user.name = "   "
    assert_not @user.valid?
  end

  test "should have an email" do
    # If email is blank, user is not valid
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    # Username should only be 64 characters long
    # Assert not valid if it is longer
    @user.name = "a" * 65
    assert_not @user.valid?
  end

  test "email should not be too long" do
    # Email should be only 256 characters long
    # Assert not valid if it is longer
    @user.email = "a" * 257
    assert_not @user.valid?
  end

  test "email should be valid" do
    # Gives a list of valid addresses
    valid_address = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp test+email@baz.cn]
    valid_address.each do |valid_address|
      #  for each case, assert valid if the user's email matches
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "validation should reject invalid email" do
    # Gives a list of invalid addresses
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      # for each case, assert invalid if the user's email matches
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    # Create a duplicate user with the same email address as the original user
    duplicate_user = @user.dup
    # So upper or lowercase doesn't matter
    duplicate_user.email = @user.email.upcase
    @user.save
    # Assert this email is not valid if it is a duplicate
    assert_not duplicate_user.valid?
# This doesn't assert uniqueness at a database level, done in user.rb
  end

  test "should have a password" do
    # 6 is minimum length, blank password means invalid
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have minimum length" do
    # Less than 5 characters means invalid
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
