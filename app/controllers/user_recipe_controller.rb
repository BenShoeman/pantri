class User_recipes_controller < ApplicationController
# this page will be where the save recipe button is implented
def new
  @user_rec= user_recip.new
end

def list
    @user_recip= user_recipes.all
end
