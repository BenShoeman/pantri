class UserCommentsController < ApplicationController
  def new
  	@user_comment = UserComment.new
  end

  def create
  	@user_comment = UserComment.new(user_comment_params)
  	
  	if @user_comment.save	
  	  redirect_to @user_comment
  	else
  	  render 'new'
  	end
  end

  def show
  	@user_comment = UserComment.find(params[:id])
  end

  def destroy
  	@user_comment = UserComment.find(params[:id])
  	@user_comment.destroy

  	redirect_to user_comments_path
  end
  
  def index
  	@user_comments = UserComment.all
  end

  private
  	def user_comment_params
  		params.require(:user_comment).permit(:subject, :comment)
  	end
end
