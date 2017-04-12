# Nabil Ettachfini and Alexander Hamlet worked on this
class User_ingredients_controller < ApplicationController
    def new
        @user_ings = userIngController.new
    end

def list
    @user_ings = user_ingredients.all # this should make a list of all ingredients
  end

def show
  @user_ingr = user_ingr.find(params(:id))
end

def create
  @user_ingr = user_ingr.new(ingredients_params)
    if @user_ingr.save
        redirect_to:action => 'list'
    else
      @subjects = Subject.all
      render :action => 'edit'
    end
end

def user_recipe_ingrediants
  params.required(:ingredients).permit(:ingredients)
end
