Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'recipes/index' => 'recipes#index'
  get 'search', to: 'recipes#search', as: :search
  root 'recipes#index'

  # making request for save action on recipe page
  # unnecessary unless recipe page is shown
  get 'recipes/:id/save' => 'recipes#save'
  # need one for index
end
