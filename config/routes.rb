Rails.application.routes.draw do
  get 'users/new'

  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'recipes/index' => 'recipes#index'
  get 'search', to: 'recipes#search', as: :search
  root 'recipes#index'
end
