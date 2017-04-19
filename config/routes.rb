Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  resources :users
  resources :user_comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'recipes/index' => 'recipes#index'
  get 'search', to: 'recipes#search', as: :search
  root 'recipes#index'

 # These currently need to be commented out in order to run the rails server, that is what the error is from
  get '/login' to: 'session#new'
  get '/login' to: 'session#create'
  get '/logout' to: 'session#destroy'
  
  #resources :users
  # making request for save action on recipe page
  # get 'recipes/:id/save' => 'recipes#save'
  # request for save on index
  post 'recipes/:id/save' => 'recipes#save'

  resource :recipes do
    get 'save', :on => :collection
  end
  post 'recipes/:id/unsave' => 'recipes#unsave'

end
