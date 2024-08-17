Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  get 'users_index', to: 'home#users_index'
  get 'users/:id', to: 'home#user_show', as: :user_show

  resources :users, only: [] do
    resources :comments, only: [:create, :destroy], controller: 'home'
  end

  root to: "home#index"
end