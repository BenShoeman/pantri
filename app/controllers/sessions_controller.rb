class SessionsController < ApplicationController
def new
end
def create
  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
      # pull user out of the database using submitted email address
    else
      # Create an error message.
      # you can create a test by doing this from the command line  $ rails generate integration_test users_login
      flash.now[:danger] = 'Invalid email/password combination' # if an incorrect email/password combo is typed in
      render 'new'
    end
end
def destroy
  log_out
 redirect_to root_url
  end
end
