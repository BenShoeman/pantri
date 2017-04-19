class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]#, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
  end

  def search
    if (params.has_key?(:q))
      if (params[:q].blank?)
        @recipes = Recipe.none()
      else
        @recipes = Recipe.search(params[:q])
      end
      # @ingredients = Recipe.getIngredients(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # Controller for saving a recipe to a user's profile
  def save
    recipe = Recipe.find(params[:id])
    # Remove this once users can log in
    current_user = User.first
    # Logged in user will get the recipe saved to them
    current_user.recipes << recipe
  end

  # Controller for unsaving a recipe to a user's profile
  def unsave
    recipe = Recipe.find(params[:id])
    # Remove this once users can log in
    current_user = User.first
    # Logged in user will be able to remove recipe from saved
    if current_user
      recipe.users.delete(current_user)
      redirect_to :back
    end
  end

  # Commenting out the below because we don't need people to edit recipe entries
  # # GET /recipes/new
  # def new
  #   @recipe = Recipe.new
  # end
  #
  # # GET /recipes/1/edit
  # def edit
  # end
  #
  # # POST /recipes
  # # POST /recipes.json
  # def create
  #   @recipe = Recipe.new(recipe_params)
  #
  #   respond_to do |format|
  #     if @recipe.save
  #       format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
  #       format.json { render :show, status: :created, location: @recipe }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @recipe.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /recipes/1
  # # PATCH/PUT /recipes/1.json
  # def update
  #   respond_to do |format|
  #     if @recipe.update(recipe_params)
  #       format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @recipe }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @recipe.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /recipes/1
  # # DELETE /recipes/1.json
  # def destroy
  #   @recipe.destroy
  #   respond_to do |format|
  #     format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :servings, :prep_time, :cook_time, :recipe_url, :image_url)
    end
end
