require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get search" do
    get root_url + "search"
    assert_response :success
  end

  test "should get search with params" do
    get root_url + "search?q=ingr3"
    assert_response :success
  end
end
