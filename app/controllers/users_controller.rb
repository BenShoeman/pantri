class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Pantri!"
      redirect_to @user
    else
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
    params.require(:user).permit(:user, :name, :email, :password, :password_confirmation)
  end
end
