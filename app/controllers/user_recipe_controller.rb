class User_recipes_controller < ApplicationController
  # this page will be where the save recipe button is implented
  # Nabil is working on this lol
  def new
    @user_recip = user_recip.new
  end

  def list
    @user_recList = user_recList.all
  end

  def show  # goal for this is if user wants they can click on saved recipes and the ingredients that go with it.
    @whole_recip = whole_recip.find(params[:id])
  end

  def create #this should work for the save button I am going to create
    @user_recip = user_recip.new(recipe_params)
    if @user_recip.save # This should redirect the user to the list method if the object saves correctly
                      # to the database, if it does not save then the user it sent back to the new method.
      redirect_to:action => 'list'
    else
      @subjects = Subject.all
      render :action => 'edit'
    end
  end

  def user_recip_param
    params.required(:recipe).permit(:recipe, :description) #the params will be the recipe and maybe a breif description of the recipe that the user saved in the user page
  end
end
