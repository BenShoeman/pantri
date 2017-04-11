class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # If create is successful
      redirect_to @user
    else
      # If create is not successful
      render 'new'
    end
  end

  def edit
     @user = User.find(params[:id])
   end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # If edit is successful
      redirect_to @user
    else
      # If edit is not successful
      render 'edit'
    end
  end

# For signup form confirmation
private
  def user_params
    params.permit(:user, :name, :email, :password, :password_confirmation)
    # deleted require(:user). may need this later but fixed error
  end
end
