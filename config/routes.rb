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

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'recipes/:id/save' => 'recipes#save'
  post 'recipes/:id/unsave' => 'recipes#unsave'

  resources :recipes do
    get 'save', :on => :collection
  end

  resources :recipes do
    resource :save, only: %w(update destroy)
  end

end
