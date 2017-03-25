class User_ingredients_controller < ApplicationController
    def new
        @user_ings = userIngController.new
    end
def list
    @user_ings = user_ingredients.all # this should make a list of all ingredients
  end
