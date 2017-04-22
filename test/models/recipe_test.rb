require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "should return 1 recipe with search('ingr1')" do
    recipes = Recipe.search('ingr1')
    assert recipes.size == 1
  end

  test "should return Recipe 1 with search('ingr1')" do
    recipes = Recipe.search('ingr1')
    assert recipes[0].name == "Recipe 1"
  end

  test "should return 2 recipes with search('ingr3')" do
    recipes = Recipe.search('ingr3')
    assert recipes.size == 2
  end

  test "should return [Recipe 1, Recipe 2] with search('ingr3')" do
    recipes = Recipe.search('ingr3')
    if recipes[0].name == "Recipe 1"
      assert recipes[0].name == "Recipe 1" and recipes[1].name == "Recipe 2"
    else
      assert recipes[1].name == "Recipe 1" and recipes[0].name == "Recipe 2"
    end
  end

  test "should return 2 recipes with search('ingr1,ingr2')" do
    recipes = Recipe.search('ingr1,ingr2')
    assert recipes.size == 2
  end

  test "should return 2 recipes with search('ingr1, ingr2, ingr3 ')" do
    recipes = Recipe.search('ingr1, ingr2, ingr3 ')
    assert recipes.size == 2
  end

  test "should return nothing with search('ingr4')" do
    recipes = Recipe.search('ingr4')
    assert recipes.size == 0
  end

  test "should return 1 recipe with search('ingr2, ingr4')" do
    recipes = Recipe.search('ingr2, ingr4')
    assert recipes.size == 1
  end

  test "should return Recipe 2 with search('ingr2, ingr4')" do
    recipes = Recipe.search('ingr2, ingr4')
    assert recipes[0].name == "Recipe 2"
  end
end
