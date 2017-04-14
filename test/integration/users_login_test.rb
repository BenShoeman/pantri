require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
def
@user = users(:User1)
@user = users(:User2)
end
  test "login with invalid information followed by logout" do

   assert is_logged_in?
   get login_path  #Visit the login path.
   assert_template 'sessions/new'  #Verify that the new sessions form renders properly.
   post login_path, params: { session: { email: "", password: "" } }   #Post to the sessions path with an invalid params hash.
   assert_template 'sessions/new' #  Verify that the new sessions form gets re-rendered and that a flash message appears.
   assert_not flash.empty? #
   get root_path #  Visit another page (such as the Home page).
   assert flash.empty? #   Verify that the flash message doesn’t appear on the new page.
   delete logout_path
   assert_not is_logged_in?
   assert_redirected_to root_url
   follow_redirect!
   assert_select "a[href=?]", login_path
   assert_select "a[href=?]", logout_path,      count: 0
   assert_select "a[href=?]", user_path(@user), count: 0gg
 end
end
