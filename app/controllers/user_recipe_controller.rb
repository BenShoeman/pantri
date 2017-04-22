class User_recipes_controller < ApplicationController

  before_action :load_post

  def update
    recipe.save!
  end

  def destroy
    recipe.unsave!
  end

  private

  def load_recipe
    recipe = Recipe.find(params[:id])
  end

end
